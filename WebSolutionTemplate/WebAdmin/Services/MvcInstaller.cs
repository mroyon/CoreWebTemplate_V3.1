using FluentValidation.AspNetCore;
using BDO.DataAccessObjects.ExtendedEntities;
using BDO.DataAccessObjects.CommonEntities;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Reflection;
using System.Threading.Tasks;
using WebAdmin.IntraServices;
//ing IdentityServer4.Services;
//using CoreWebApplicationFilters;
//using CLL.Localization;
using WebAdmin.Providers;
using WebAdmin.FilterAndAttributes;
using CLL.Localization;
using IdentityServer4.Services;
using BDO.DataAccessObjects.SecurityModule;
using Web.Core.Frame.CustomIdentityManagers;
using Web.Core.Frame.CustomStores;
using Newtonsoft.Json.Serialization;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Web.Api.Infrastructure.Auth;

namespace WebAdmin.Services
{
    /// <summary>
    /// MvcInstaller
    /// </summary>
    public class WebAdmin : IInstaller
    {
        /// <summary>
        /// InstallServices
        /// </summary>
        /// <param name="services"></param>
        /// <param name="configuration"></param>
        public void InstallServices(IServiceCollection services, IConfiguration _configuration)
        {

            services.AddResponseCaching();

            services.Configure<EmailSettings>(_configuration.GetSection("EmailSettings"));
            services.AddTransient<IEmailSender, EmailSender>();
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            services.Configure<CookiePolicyOptions>(options =>
            {
                options.MinimumSameSitePolicy = SameSiteMode.Unspecified;
                options.OnAppendCookie = cookieContext =>
                    CheckSameSite(cookieContext.Context, cookieContext.CookieOptions);
                options.OnDeleteCookie = cookieContext =>
                    CheckSameSite(cookieContext.Context, cookieContext.CookieOptions);
            });

            AddLocalizationConfigurations(services);

            services.AddCors(options =>
            {
                options.AddPolicy("AllowAllOrigins",
                    builder =>
                    {
                        builder
                            .AllowCredentials()
                             .WithOrigins("https://localhost:44318")
                            .SetIsOriginAllowedToAllowWildcardSubdomains()
                            .AllowAnyHeader()
                            .AllowAnyMethod();
                    });
            });

            services.AddTransient<IProfileService, IdentityWithAdditionalClaimsProfileService>();

            services.AddIdentityCore<owin_userEntity>(options =>
            {
                options.Password.RequireDigit = false;
                options.Password.RequiredLength = 4;
                options.Password.RequireNonAlphanumeric = false;
                options.Password.RequireUppercase = false;
                options.Password.RequireLowercase = false;
                options.SignIn.RequireConfirmedEmail = false;
                options.SignIn.RequireConfirmedPhoneNumber = false;
            })
              .AddRoles<IdentityRole>()
             .AddErrorDescriber<CusIdentityErrorDescriber>()
             .AddDefaultTokenProviders()
             .AddUserManager<ApplicationUserManager<owin_userEntity>>()
             .AddSignInManager<ApplicationSignInManager<owin_userEntity>>();

            services.AddTransient<SecurityFillerAttribute>();
            services.AddSingleton<IUserStore<owin_userEntity>, CustomUserStore>();
            services.AddSingleton<IRoleStore<IdentityRole>, CustomRoleStore>();

            services.AddScoped<IUserClaimsPrincipalFactory<owin_userEntity>, AdditionalUserClaimsPrincipalFactory>();
            services.AddScoped<IPasswordHasher<owin_userEntity>, CusPasswordHasher<owin_userEntity>>();


            services
              .AddMvc(options =>
              {
                  options.EnableEndpointRouting = false;
                  options.Conventions.Add(new AddAuthorizeFiltersControllerConvention());
                    //options.Filters.Add<ValidationFilter>();
                    options.Filters.Add<SecurityFillerAttribute>();
              })
              .AddNewtonsoftJson(options => options.SerializerSettings.ContractResolver = new DefaultContractResolver())
              .AddFluentValidation(mvcConfiguration => mvcConfiguration.RegisterValidatorsFromAssemblyContaining<Startup>())
              .SetCompatibilityVersion(CompatibilityVersion.Version_3_0);


            services.Configure<AuthSettings>(_configuration.GetSection(nameof(AuthSettings)));
            var authSettings = _configuration.GetSection(nameof(AuthSettings)).Get<AuthSettings>();
            var signingKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(authSettings.SecretKey));
            var jwtIssuerOptions = _configuration.GetSection(nameof(JwtIssuerOptions)).Get<JwtIssuerOptions>();

            services.Configure<JwtIssuerOptions>(options =>
            {
                options.Issuer = jwtIssuerOptions.Issuer;
                options.Audience = jwtIssuerOptions.Audience;
                options.SigningCredentials = new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256);
            });


            services.ConfigureApplicationCookie(options =>
            {
                options.Cookie.HttpOnly = true;
                options.Cookie.SameSite = SameSiteMode.Strict;
                //options.Cookie.SecurePolicy = CookieSecurePolicy.Always;
                //options.AccessDeniedPath = $"/account/accessDenied";
                //options.SlidingExpiration = true;
            });

            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = IdentityConstants.ApplicationScheme;
                options.DefaultChallengeScheme = IdentityConstants.ApplicationScheme;
                options.DefaultSignInScheme = IdentityConstants.ExternalScheme;

            }).AddCookie()
                .AddJwtBearer(options =>
                {
                    options.ClaimsIssuer = jwtIssuerOptions.Issuer;
                    options.SaveToken = true;
                    options.RequireHttpsMetadata = false;
                    options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters()
                    {

                        ValidateIssuer = true,
                        ValidIssuer = jwtIssuerOptions.Issuer,

                        ValidateAudience = true,
                        ValidAudience = jwtIssuerOptions.Audience,

                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = signingKey,

                        RequireExpirationTime = false,
                        ValidateLifetime = true,
                        ClockSkew = TimeSpan.Zero
                    };
                    options.Events = new JwtBearerEvents
                    {
                        OnAuthenticationFailed = context =>
                        {
                            if (context.Exception.GetType() == typeof(SecurityTokenExpiredException))
                            {
                                context.Response.Headers.Add("Token-Expired", "true");
                            }
                            return Task.CompletedTask;
                        },
                        OnMessageReceived = context =>
                        {
                            return Task.CompletedTask;
                        }
                    };
                })
                .AddIdentityCookies(options => {});

            services.AddAntiforgery(options =>
            {
                // Set Cookie properties using CookieBuilder properties†.
                options.Cookie.Name = "X-CSRF-TOKEN-WEBADMIN";
                options.HeaderName = "X-CSRF-TOKEN-WEBADMINHEADER";
                options.FormFieldName = "X-CSRF-TOKEN-WEBADMIN";
                options.SuppressXFrameOptionsHeader = false;
            });

            services.AddAuthorization(options =>
            {
                options.AddPolicy("defaultpolicy", b =>
                {
                    b.RequireAuthenticatedUser();
                });
                options.AddPolicy("apipolicy", policy =>
                {
                    policy.RequireAuthenticatedUser();
                    policy.AuthenticationSchemes = new List<string> { JwtBearerDefaults.AuthenticationScheme };
                });
            });

            //services.AddSingleton<IAuthorizationHandler, Myhandler>();

            services.AddControllersWithViews(options =>
            {
                options.Filters.Add(new SecurityHeadersAttribute());
                options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute());
            })
                .AddViewLocalization()
                 .AddRazorRuntimeCompilation()
                .AddDataAnnotationsLocalization(options =>
                {
                    options.DataAnnotationLocalizerProvider = (type, factory) =>
                    {
                        //ronty
                        var assemblyName = new AssemblyName(typeof(SharedResource).GetTypeInfo().Assembly.FullName);
                        return factory.Create("SharedResource", assemblyName.Name);
                    };
                })
                .AddNewtonsoftJson();


            //for session enable
            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(20);
                options.Cookie.HttpOnly = true;
                options.Cookie.SameSite = SameSiteMode.Strict;
                options.Cookie.SecurePolicy = CookieSecurePolicy.Always;
            });
        }

        /// <summary>
        /// AddLocalizationConfigurations
        /// </summary>
        /// <param name="services"></param>
        private static void AddLocalizationConfigurations(IServiceCollection services)
        {
            services.AddSingleton<LocalizeService>();

            services.AddLocalization(options => options.ResourcesPath = "Localization");

            services.Configure<RequestLocalizationOptions>(
                options =>
                {
                    var supportedCultures = new List<CultureInfo>
                        {
                            new CultureInfo("en-US"),
                            new CultureInfo("ar-KW")
                        };

                    options.DefaultRequestCulture = new RequestCulture(culture: "en-US", uiCulture: "ar-KW");
                    options.SupportedCultures = supportedCultures;
                    options.SupportedUICultures = supportedCultures;

                    var providerQuery = new LocalizationQueryProvider
                    {
                        QueryParameterName = "ui_locales"
                    };

                    options.RequestCultureProviders.Insert(0, providerQuery);
                });
        }
        /// <summary>
        /// CheckSameSite
        /// </summary>
        /// <param name="httpContext"></param>
        /// <param name="options"></param>
        private static void CheckSameSite(HttpContext httpContext, CookieOptions options)
        {
            if (options.SameSite == SameSiteMode.None)
            {
                var userAgent = httpContext.Request.Headers["User-Agent"].ToString();
                if (DisallowsSameSiteNone(userAgent))
                {
                    // For .NET Core < 3.1 set SameSite = (SameSiteMode)(-1)
                    options.SameSite = SameSiteMode.Unspecified;
                }
            }
        }
        /// <summary>
        /// DisallowsSameSiteNone
        /// </summary>
        /// <param name="userAgent"></param>
        /// <returns></returns>
        private static bool DisallowsSameSiteNone(string userAgent)
        {
            // Cover all iOS based browsers here. This includes:
            // - Safari on iOS 12 for iPhone, iPod Touch, iPad
            // - WkWebview on iOS 12 for iPhone, iPod Touch, iPad
            // - Chrome on iOS 12 for iPhone, iPod Touch, iPad
            // All of which are broken by SameSite=None, because they use the iOS networking stack
            if (userAgent.Contains("CPU iPhone OS 12") || userAgent.Contains("iPad; CPU OS 12"))
            {
                return true;
            }

            // Cover Mac OS X based browsers that use the Mac OS networking stack. This includes:
            // - Safari on Mac OS X.
            // This does not include:
            // - Chrome on Mac OS X
            // Because they do not use the Mac OS networking stack.
            if (userAgent.Contains("Macintosh; Intel Mac OS X 10_14") &&
                userAgent.Contains("Version/") && userAgent.Contains("Safari"))
            {
                return true;
            }

            // Cover Chrome 50-69, because some versions are broken by SameSite=None, 
            // and none in this range require it.
            // Note: this covers some pre-Chromium Edge versions, 
            // but pre-Chromium Edge does not require SameSite=None.
            if (userAgent.Contains("Chrome/5") || userAgent.Contains("Chrome/6"))
            {
                return true;
            }

            return false;
        }
    }
}
