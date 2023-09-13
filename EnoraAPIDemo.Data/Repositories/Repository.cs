using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using EnoraAPIDemo.Core.Repositories;
using EnoraAPIDemo.Core.ViewModels;
using System.Data;
using EnoraAPIDemo.Core.Models;
using Dapper;

namespace EnoraAPIDemo.Data.Repositories
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        protected readonly EnoraAPIDemoAPIContext Context;
        int _commandTimeout;

        public Repository(EnoraAPIDemoAPIContext context)
        {
            this.Context = context;
            _commandTimeout = 30;
        }
        public async Task AddAsync(TEntity entity)
        {
            await Context.Set<TEntity>().AddAsync(entity);
        }

        public async Task AddRangeAsync(IEnumerable<TEntity> entities)
        {
            await Context.Set<TEntity>().AddRangeAsync(entities);
        }

        public IEnumerable<TEntity> Find(Expression<Func<TEntity, bool>> predicate)
        {
            return Context.Set<TEntity>().Where(predicate);
        }
        public TEntity GetObject(Expression<Func<TEntity, bool>> filter)
        {
            return Context.Set<TEntity>().Where(filter).FirstOrDefault();
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            return await Context.Set<TEntity>().ToListAsync();
        }

        public async Task<List<TResult>> GetCustomListAsync<TResult>(Expression<Func<TEntity, TResult>> selector,
                   Expression<Func<TEntity, bool>> filter = null,
                   params Expression<Func<TEntity, object>>[] includes)
        {
            IQueryable<TEntity> query = Context.Set<TEntity>();

            if (filter != null) query = query.Where(filter);

            if (includes != null)
            {
                foreach (Expression<Func<TEntity, object>> include in includes)
                    query = query.Include(include);
            }

            return await query.Select(selector).ToListAsync();
        }


        

        public async Task<TResult> FirstOrDefaultAsync<TResult>(Expression<Func<TEntity, TResult>> selector, Expression<Func<TEntity, bool>> filter = null, params Expression<Func<TEntity, object>>[] includes)
        {
            IQueryable<TEntity> query = Context.Set<TEntity>();

            if (filter != null) query = query.Where(filter);

            if (includes != null)
            {
                foreach (Expression<Func<TEntity, object>> include in includes)
                    query = query.Include(include);
            }

            return await query.Select(selector).FirstOrDefaultAsync();
        }

        public ValueTask<TEntity> GetByIdAsync(int id)
        {
            return Context.Set<TEntity>().FindAsync(id);
        }

        public void Remove(TEntity entity)
        {
            Context.Set<TEntity>().Remove(entity);
        }

        public void RemoveRange(IEnumerable<TEntity> entities)
        {
            Context.Set<TEntity>().RemoveRange(entities);
        }

        public Task<TEntity> SingleOrDefaultAsync(Expression<Func<TEntity, bool>> predicate)
        {
            return Context.Set<TEntity>().SingleOrDefaultAsync(predicate);
        }

        public Task<TEntity> FirstOrDefaultAsync(Expression<Func<TEntity, bool>> predicate)
        {
            return Context.Set<TEntity>().FirstOrDefaultAsync(predicate);
        }

        #region :: SP Methods ::
        public IEnumerable<T> GetList<T>(CommandType commandType, string sql, List<ParametersCollection> parameters = null)
        {
            try
            {
                DynamicParameters DParameters = new DynamicParameters();
                if (parameters != null)
                {
                    foreach (ParametersCollection parameter in parameters)
                    {
                        DParameters.Add(parameter.ParamterName, parameter.ParamterValue, dbType: parameter.ParamterType, direction: parameter.ParameterDirection);
                    }
                }

                using (var connection = Context.Database.GetDbConnection())
                {
                    IEnumerable<T> ReturnList = connection.Query<T>(sql, DParameters, null, true, _commandTimeout, commandType: commandType);
                    connection.Close();
                    return ReturnList;
                }
            }
            catch (Exception ex)
            {
                IEnumerable<T> ReturnList = null;
                return ReturnList;
            }
        }

        public T GetSingle<T>(CommandType commandType, string sql, List<ParametersCollection> parameters = null)
        {
            try
            {
                DynamicParameters DParameters = new DynamicParameters();
                if (parameters != null)
                {
                    foreach (ParametersCollection parameter in parameters)
                    {
                        DParameters.Add(parameter.ParamterName, parameter.ParamterValue, dbType: parameter.ParamterType, direction: parameter.ParameterDirection);
                    }
                }

                using (var connection = Context.Database.GetDbConnection())
                {
                    T ReturnSingle = connection.QueryFirstOrDefault<T>(sql, DParameters, null, _commandTimeout, commandType: commandType);
                    connection.Close();
                    return ReturnSingle;
                }
            }
            catch (Exception ex)
            {
                T ReturnSingle = default(T);
                return ReturnSingle;
            }
        }

        public void Execute(CommandType commandType, string sql, List<ParametersCollection> parameters = null)
        {
            try
            {
                DynamicParameters DParameters = new DynamicParameters();
                if (parameters != null)
                {
                    foreach (ParametersCollection parameter in parameters)
                    {
                        DParameters.Add(parameter.ParamterName, parameter.ParamterValue, dbType: parameter.ParamterType, direction: parameter.ParameterDirection);
                    }
                }

                using (var connection = Context.Database.GetDbConnection())
                {
                    connection.Execute(sql, DParameters, null, _commandTimeout, commandType: commandType);
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
            }
        }

        public int ExecuteWithReturnValue(CommandType commandType, string sql, List<ParametersCollection> parameters = null)
        {
            try
            {
                DynamicParameters DParameters = new DynamicParameters();
                if (parameters != null)
                {
                    foreach (ParametersCollection parameter in parameters)
                    {
                        DParameters.Add(parameter.ParamterName, parameter.ParamterValue, dbType: parameter.ParamterType, direction: parameter.ParameterDirection);
                    }
                    DParameters.Add("ReturnValue", dbType: DbType.Int64, direction: ParameterDirection.ReturnValue);
                }

                using (var connection = Context.Database.GetDbConnection())
                {
                    connection.Execute(sql, DParameters, null, _commandTimeout, commandType: commandType);
                    connection.Close();
                }

                int ReturnValue = DParameters.Get<int>("ReturnValue");
                return ReturnValue;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        #endregion
    }
}
