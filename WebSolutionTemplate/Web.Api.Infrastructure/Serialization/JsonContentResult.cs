using Microsoft.AspNetCore.Mvc;

namespace Web.Api.Infrastructure.Serialization
{
  public sealed class JsonContentResult : ContentResult
  {
    public JsonContentResult()
    {
      ContentType = "application/json";
    }
  }
}
