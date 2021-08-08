using AspNetCore.CacheOutput.Extensions;
using Autofac;
using Autofac.Extensions.DependencyInjection;
using AutoMapper;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using Serilog;
using System;
using System.Reflection;
using Web.Api.Infrastructure;
using Web.Core.Frame;
using Web.Core.Frame.Interfaces.UseCases;
using Web.Core.Frame.UseCases;
using WebAdmin.Services;

namespace WebAdmin
{
    /// <summary>
    /// 
    /// </summary>
    public class Startup
    {
        /// <summary>
        /// _configuration
        /// </summary>
        public IConfiguration _configuration { get; }
        /// <summary>
        /// _environment 
        /// </summary>
        public IWebHostEnvironment _environment { get; }
        public ILifetimeScope AutofacContainer { get; private set; }
        /// <summary>
        /// Startup
        /// </summary>
        /// <param name="configuration"></param>
        /// <param name="env"></param>
        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration = configuration;
            _environment = env;
        }
        /// <summary>
        /// ConfigureServices
        /// </summary>
        /// <param name="services"></param>
        public IServiceProvider  ConfigureServices(IServiceCollection services)
        {
            services.InstallServicesInAssembly(_configuration);

            services.AddAutoMapper(typeof(Startup));
            var builder = new ContainerBuilder();


            builder.Populate(services);
            
            builder.RegisterModule(new CoreModule());
            builder.RegisterModule(new CoreModuleExtended());
            builder.RegisterModule(new InfrastructureModule());
            builder.RegisterModule(new CorePresenter());
            

            //builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly()).Where(t => t.Name.EndsWith("Presenter")).SingleInstance();
            AutofacContainer = builder.Build();
            // Presenters
            

            // Create the IServiceProvider based on the container.
            return new AutofacServiceProvider(AutofacContainer);

        }
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.

        /// <summary>
        /// 
        /// </summary>
        /// <param name="app"></param>
        /// <param name="env"></param>
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, IMapper mapper, IAntiforgery antiforgery)
        {
            mapper.ConfigurationProvider.AssertConfigurationIsValid();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseRouting();
            app.UseResponseCaching();
            app.UseCors("AllowAllOrigins");

            app.UseCsp(opts => opts
                .BlockAllMixedContent()
                .StyleSources(s => s.Self())
                .StyleSources(s => s.UnsafeInline())
                .FontSources(s => s.Self())
                .FrameAncestors(s => s.Self())
                .FrameAncestors(s => s.CustomSources(
                    "https://localhost:44310")
                 )
                .ImageSources(imageSrc => imageSrc.Self())
                .ImageSources(imageSrc => imageSrc.CustomSources("http://www.gravatar.com"))
                .ImageSources(imageSrc => imageSrc.CustomSources("data:"))
                .ScriptSources(s => s.UnsafeInline())
                .ScriptSources(s => s.Self()
                    .CustomSources("localhost", "www.google.com", "www.gstatic.com")
                    //.CustomSources("www.google.com","cse.google.com","cdn.syndication.twimg.com","platform.twitter.com" ... )
                    .UnsafeInline().UnsafeEval())
            );

            app.UseHsts(options => options.MaxAge(days: 30));
            app.UseXContentTypeOptions();
            app.UseXXssProtection(options => options.EnabledWithBlockMode());
            app.UseXfo(options => options.SameOrigin());
            app.UseReferrerPolicy(opts => opts.NoReferrer());

            var locOptions = app.ApplicationServices.GetService<IOptions<RequestLocalizationOptions>>();
            app.UseRequestLocalization(locOptions.Value);

            app.UseStaticFiles(new StaticFileOptions()
            {
                OnPrepareResponse = context =>
                {
                    if (context.Context.Response.Headers["feature-policy"].Count == 0)
                    {
                        var featurePolicy = "accelerometer 'none'; camera 'none'; geolocation 'none'; gyroscope 'none'; magnetometer 'none'; microphone 'none'; payment 'none'; usb 'none'";

                        context.Context.Response.Headers["feature-policy"] = featurePolicy;
                    }

                    if (context.Context.Response.Headers["X-Content-Security-Policy"].Count == 0)
                    {
                        var csp = "script-src 'self';style-src 'self'; img-src * 'self' data:;font-src 'self';form-action 'self';frame-ancestors 'self';block-all-mixed-content";
                        // IE
                        context.Context.Response.Headers["X-Content-Security-Policy"] = csp;
                    }
                }
            });

            app.UseSession();
            
            //comment out below if every request needs to be logged.
            //app.UseSerilogRequestLogging();

            app.UseStatusCodePages();
            //app.UseHttpsRedirection();
            app.UseAuthentication();
            app.Use(async (context, next) =>
            {
                if (context.User != null && context.User.Identity.IsAuthenticated)
                {
                    // add claims here 
                    //context.User.Claims.Append(new Claim("type-x", "value-x"));
                }
                await next();
            });

            var cookiePolicyOptions = new CookiePolicyOptions
            {
                //Secure = Microsoft.AspNetCore.Http.CookieSecurePolicy.Always,
            };
            app.UseCookiePolicy(cookiePolicyOptions);

            app.UseAuthorization();
            app.UseCacheOutput();

            //Linux hosting as service
            app.UseForwardedHeaders(new ForwardedHeadersOptions
            {
                ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
            });

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.MapControllerRoute(name: "default", pattern: "{controller=Home}/{action=Index}/{id?}");
            });

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V2.0");
            });
        }
    }
}
