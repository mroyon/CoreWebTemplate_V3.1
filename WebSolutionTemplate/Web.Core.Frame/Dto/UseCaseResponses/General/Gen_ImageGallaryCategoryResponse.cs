using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using Web.Core.Frame.Dto;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.ExtendedEntities;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Gen_ImageGallaryCategoryResponse : UseCaseResponseMessage
    {
        public gen_imagegallarycategoryEntity _gen_ImageGallaryCategory { get; }

        public IEnumerable<gen_imagegallarycategoryEntity> _gen_ImageGallaryCategoryList { get; }

        public Error Errors { get; }


        public Gen_ImageGallaryCategoryResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Gen_ImageGallaryCategoryResponse(IEnumerable<gen_imagegallarycategoryEntity> gen_ImageGallaryCategoryList, bool success = false, string message = null) : base(success, message)
        {
            _gen_ImageGallaryCategoryList = gen_ImageGallaryCategoryList;
        }
        
        public Gen_ImageGallaryCategoryResponse(gen_imagegallarycategoryEntity gen_ImageGallaryCategory, bool success = false, string message = null) : base(success, message)
        {
            _gen_ImageGallaryCategory = gen_ImageGallaryCategory;
        }
    }
}
