using AutoMapper;
using EntityModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web.Http;
using WebApplication1.App_Start;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class HomeController : ApiController
    {
        public HomeController()
        {

        }
        //[BasicAuthenticationAttribute]
        [HttpGet]
        public HttpResponseMessage GetEmployees()
        {
            //string username = Thread.CurrentPrincipal.Identity.Name;
            using (var db = new EmployeeEntities())
            {
                try
                {
                    var employeeList = db.tblEmployees.ToList();
                    return Request.CreateResponse(HttpStatusCode.OK, employeeList);
                }
                catch (Exception ex)
                {
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
                }
            }
        }

        [HttpGet]
        public HttpResponseMessage GetEmployee(int id)
        {
            using (var db = new EmployeeEntities())
            {
                try
                {
                    var employee = db.tblEmployees.Where(x => x.Id == id).FirstOrDefault();
                    if (employee == null)
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound);
                    }
                    return Request.CreateResponse(HttpStatusCode.OK, employee);
                }
                catch (Exception ex)
                {
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
                }
            }
        }
        [HttpPost]
        public HttpResponseMessage SaveEmployee(tblEmployee employee)
        {
            using (var db = new EmployeeEntities())
            {
                try
                {
                    db.tblEmployees.Add(employee);
                    db.SaveChanges();
                    return new HttpResponseMessage(HttpStatusCode.OK);
                }
                catch (Exception ex)
                {
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
                }
            }
        }
        [HttpPut]
        public HttpResponseMessage UpdateEmployee(int id, tblEmployee employee)
        {
            using (var db = new EmployeeEntities())
            {
                try
                {
                    var employeeDetail = db.tblEmployees.Find(id);
                    if (employeeDetail != null)
                    {
                        Mapper.Initialize(cfg =>
                        {
                            cfg.CreateMap<tblEmployee, EmployeeViewModel>();
                        });
                        var mappedEmployeeData = Mapper.Map<tblEmployee, EmployeeViewModel>(employee);
                        db.Entry(employeeDetail).CurrentValues.SetValues(mappedEmployeeData);
                        db.SaveChanges();
                        return new HttpResponseMessage(HttpStatusCode.OK);
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound);
                    }
                }
                catch (Exception ex)
                {
                    return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
                }
            }
        }
        /// <summary>
        /// Remove HttpResponseMessage From this API as IHttpActionResult is the new feature of WebAPI 2.0...
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpDelete]
        public IHttpActionResult DeleteEmployee(int id)
        {
            using (var db = new EmployeeEntities())
            {
                try
                {
                    var employee = db.tblEmployees.Find(id);
                    if (employee != null)
                    {
                        db.Entry(employee).State = EntityState.Deleted;
                        db.SaveChanges();
                        return Ok();
                    }
                    else
                    {
                        return Content(HttpStatusCode.NotFound, "Employee Not Found");
                    }
                }
                catch (Exception ex)
                {
                    return Content(HttpStatusCode.InternalServerError, ex.Message);
                }
            }
        }
    }
}
