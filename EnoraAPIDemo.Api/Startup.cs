using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using System;
using EnoraAPIDemo.Api.Filters;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Data;
using EnoraAPIDemo.Services;
using EnoraAPIDemo.Utility;

namespace EnoraAPIDemo.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "EnoraAPIDemo.Api", Version = "v1" });
            });
            services.AddHttpClient();

            services.AddMvc(o => o.InputFormatters.Insert(0, new RawRequestBodyFormatter()));

            services.AddMvc().ConfigureApiBehaviorOptions(options =>
            {
                string ControllerName = "";
                string ActionName = "";
                try
                {

                    options.InvalidModelStateResponseFactory = actionContext =>
                    {
                        ControllerName = actionContext.RouteData.Values["controller"]?.ToString();
                        ActionName = actionContext.RouteData.Values["action"]?.ToString();
                        return new BadRequestObjectResult(Master.FormatOutput(actionContext.ModelState, ControllerName, ActionName));
                    };
                }
                catch (Exception ex)
                {

                }
            });

            services.AddScoped<IUnitOfWork, UnitOfWork>();

            var jwtTokenConfig = Configuration.GetSection("jwtTokenConfig").Get<JwtTokenConfig>();
            services.AddSingleton(jwtTokenConfig);
            services.AddScoped<IUserService, UserService>();
            services.AddScoped<IJwtAuthManager, JwtAuthManager>();
            services.AddScoped<IMasterServices, MasterServices>();
            services.AddScoped<IApplicationPermissionService, ApplicationPermissionService>();

            services.AddScoped<IRoleService, RoleService>();
            services.AddScoped<IRolePermissionService, RolePermissionService>();
            services.AddScoped<IPermissionService, PermissionService>();
            services.AddScoped<IItemMasterService, ItemMasterService>();




            services.AddScoped<ITermsAndConditionService, TermsAndConditionService>();





            services.AddAutoMapper(typeof(Startup));

            services.AddDbContext<EnoraAPIDemoAPIContext>(options =>
            options.UseSqlServer(Configuration.GetConnectionString("EnoraAPIDemoConnection"),
                x => x.MigrationsAssembly("EnoraAPIDemo.Data")));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "EnoraAPIDemo.Api v1"));
            }

            //app.UseHttpsRedirection();
            app.UseAuthentication();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
