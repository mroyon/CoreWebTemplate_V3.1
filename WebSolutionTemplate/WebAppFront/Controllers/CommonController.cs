using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using reCAPTCHA.AspNetCore.Attributes;


namespace WebAppFront.Controllers
{
    /// <summary>
    /// CommonController
    /// </summary>
    public class CommonController : Controller
    {

        /// <summary>
        /// getCaptcha
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        [HttpGet]
        public async Task<ActionResult> getCaptcha()
        {
            try
            {

                string strCode = string.Empty;
                string imageBase64 = string.Empty;
                string EncCode = string.Empty;

                //AppConfig.HelperClasses.transactioncodeGen objGenString = new AppConfig.HelperClasses.transactioncodeGen();
                //strCode = objGenString.GetRandomAlphaNumericString(5);

                //AppConfig.HelperClasses.clsCaptchaGenerator obj = new AppConfig.HelperClasses.clsCaptchaGenerator();
                //imageBase64 = obj.GetCapchaImage(strCode, 60, 170, 16, 10);

                //AppConfig.EncryptionHandler.EncryptionHelper objStringEnc = new AppConfig.EncryptionHandler.EncryptionHelper();
                //AppConfig.HelperClasses.clsPrivateKeys objKey = new AppConfig.HelperClasses.clsPrivateKeys();

                //EncCode = objStringEnc.Encrypt(strCode, true, objKey.getPrivateKey());

                //await Task.Delay(1).ConfigureAwait(true);

                var result = new
                {
                    imagecaptcha = imageBase64,
                    codeenc = EncCode
                };
                return Json(new { result });
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
