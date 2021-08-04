using BDO.DataAccessObjects.Models;
using System.Collections.Generic;
using Web.Core.Frame.Dto;
using Web.Core.Frame.Interfaces;
using BDO.DataAccessObjects.ExtendedEntities;

namespace Web.Core.Frame.RequestResponse.UseCaseResponses
{
    public class Gen_ImageGallaryResponse : UseCaseResponseMessage
    {
        public gen_imagegallaryEntity _gen_ImageGallary { get; }

        public IEnumerable<gen_imagegallaryEntity> _gen_ImageGallaryList { get; }

        public Error Errors { get; }


        public Gen_ImageGallaryResponse(bool success = false, string message = null, Error errors = null) : base(success, message)
        {
            Errors = errors;
        }

        public Gen_ImageGallaryResponse(IEnumerable<gen_imagegallaryEntity> gen_ImageGallaryList, bool success = false, string message = null) : base(success, message)
        {
            _gen_ImageGallaryList = gen_ImageGallaryList;
        }
        
        public Gen_ImageGallaryResponse(gen_imagegallaryEntity gen_ImageGallary, bool success = false, string message = null) : base(success, message)
        {
            _gen_ImageGallary = gen_ImageGallary;
        }
    }
}
