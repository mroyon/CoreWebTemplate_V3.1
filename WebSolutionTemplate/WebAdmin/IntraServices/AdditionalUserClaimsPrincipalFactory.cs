﻿using AppConfig.EncryptionHandler;
using AppConfig.HelperClasses;
using BDO.Base;
using BDO.DataAccessObjects.ExtendedEntities;
using BDO.DataAccessObjects.SecurityModule;
using IdentityModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Web.Core.Frame.CustomIdentityManagers;

namespace WebAdmin.IntraServices
{
    public class AdditionalUserClaimsPrincipalFactory : UserClaimsPrincipalFactory<owin_userEntity, IdentityRole>
    {
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly ApplicationUserManager<owin_userEntity> _userManager;
        private readonly IConfiguration _config;


        /// <summary>
        /// AdditionalUserClaimsPrincipalFactory
        /// </summary>
        /// <param name="userManager"></param>
        /// <param name="roleManager"></param>
        /// <param name="optionsAccessor"></param>
        /// <param name="contextAccessor"></param>
        public AdditionalUserClaimsPrincipalFactory(
            ApplicationUserManager<owin_userEntity> userManager,
            RoleManager<IdentityRole> roleManager,
            IOptions<IdentityOptions> optionsAccessor,
                        IHttpContextAccessor contextAccessor,
                        IConfiguration config)
            : base(userManager, roleManager, optionsAccessor)
        {
            _contextAccessor = contextAccessor;
            _userManager = userManager;
            _config = config;

        }

        /// <summary>
        /// CreateAsync
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public async override Task<ClaimsPrincipal> CreateAsync(owin_userEntity user)
        {
            var principal = await base.CreateAsync(user);
            var identity = (ClaimsIdentity)principal.Identity;
            DateTime dt = DateTime.Now;

            var claims = new List<Claim>
            {
                new Claim(JwtClaimTypes.Role, "dataEventRecords"),
                new Claim(JwtClaimTypes.Role, "dataEventRecords.user")
            };

            SecurityCapsule _securityCapsule = new SecurityCapsule();
            _securityCapsule.masteruserid = user.masteruserid;
            _securityCapsule.updatedbyusername = user.username;

            _securityCapsule.updateddate = dt;
            _securityCapsule.createdbyusername = user.username;
            _securityCapsule.createddate = dt;
            _securityCapsule.transid = "NEWTRANSID";
            _securityCapsule.userid = user.userid.GetValueOrDefault();
            _securityCapsule.email = user.emailaddress;
            _securityCapsule.username = user.username;
            _securityCapsule.isauthenticated = true;
            // one time 
            transactioncodeGen objTranIDGen = new transactioncodeGen();
            _securityCapsule.sessionid =  _contextAccessor.HttpContext.Session.Id;
            _securityCapsule.transid = objTranIDGen.GetRandomAlphaNumericStringForTransactionActivity("TRANS", dt);
            _securityCapsule.usertoken = _securityCapsule.transid;

            //_securityCapsule.actioname = actionName;
            //_securityCapsule.controllername = controllerName;
            _securityCapsule.pageurl = _contextAccessor.HttpContext.Request.GetDisplayUrl();
            _securityCapsule.ipaddress = _contextAccessor.HttpContext.Connection.RemoteIpAddress.ToString();

            string strserialize = JsonConvert.SerializeObject(_securityCapsule);

            EncryptionHelper objEnc = new EncryptionHelper();
            var authSettings = _config.GetSection(nameof(AuthSettings)).Get<AuthSettings>();
            strserialize = objEnc.Encrypt(strserialize, true, authSettings.SecretKey);
            claims.Add(new Claim("secobject", strserialize));

            var resLoginSerial = await _userManager.loginowin_userlogintrail(_securityCapsule);
            if(resLoginSerial > 0)
                claims.Add(new Claim("resLoginSerial", resLoginSerial.ToString()));

            if (user.DataEventRecordsRole == "dataEventRecords.admin")
            {
                claims.Add(new Claim(JwtClaimTypes.Role, "dataEventRecords.admin"));
            }

            if (user.IsAdmin)
            {
                claims.Add(new Claim(JwtClaimTypes.Role, "admin"));
            }
            else
            {
                claims.Add(new Claim(JwtClaimTypes.Role, "user"));
            }

            identity.AddClaims(claims);
            return principal;
        }
    }
}
