using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebFormsTeste.Core.Startup))]
namespace WebFormsTeste.Core
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
