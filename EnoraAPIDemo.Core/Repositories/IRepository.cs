using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using EnoraAPIDemo.Core.ViewModels;

namespace EnoraAPIDemo.Core.Repositories
{
    public interface  IRepository<TEntity> where TEntity : class
    {
        ValueTask<TEntity> GetByIdAsync(int id);
        Task<IEnumerable<TEntity>> GetAllAsync();

        Task<TResult> FirstOrDefaultAsync<TResult>(Expression<Func<TEntity, TResult>> selector, Expression<Func<TEntity, bool>> filter = null, params Expression<Func<TEntity, object>>[] includes);

        Task<TEntity> SingleOrDefaultAsync(Expression<Func<TEntity, bool>> filter);
        Task<TEntity> FirstOrDefaultAsync(Expression<Func<TEntity, bool>> filter);

        Task<List<TResult>> GetCustomListAsync<TResult>(Expression<Func<TEntity, TResult>> selector,
                   Expression<Func<TEntity, bool>> filter = null,
                   params Expression<Func<TEntity, object>>[] includes);

        

        IEnumerable<TEntity> Find(Expression<Func<TEntity, bool>> predicate);

        TEntity GetObject(Expression<Func<TEntity, bool>> filter);
        Task AddAsync(TEntity entity);
        Task AddRangeAsync(IEnumerable<TEntity> entities);
        void Remove(TEntity entity);
        void RemoveRange(IEnumerable<TEntity> entities);
        
    }
}