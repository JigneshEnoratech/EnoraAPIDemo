using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnoraAPIDemo.Core;
using EnoraAPIDemo.Core.Models;
using EnoraAPIDemo.Core.Services;
using EnoraAPIDemo.Utility;

namespace EnoraAPIDemo.Services
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _unitOfWork;
        public UserService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public async Task<User> CreateUser(User newUser)
        {
            await _unitOfWork.Users.AddAsync(newUser);
            await _unitOfWork.CommitAsync();
            return newUser;
        }

        public async Task DeleteUser(User User)
        {
            _unitOfWork.Users.Remove(User);
            await _unitOfWork.CommitAsync();
        }

        public async Task<User> GetUserById(int id)
        {
            return await _unitOfWork.Users.GetWithUserByIdAsync(id);
        }

        public async Task<User> GetUserByUserId(int userId)
        {
            return await _unitOfWork.Users.GetUserByIdAsync(userId);
        }

        public async Task UpdateUser(User UserToBeUpdated, User User)
        {
            UserToBeUpdated.RoleId = User.RoleId;
            UserToBeUpdated.Password = User.Password;
            UserToBeUpdated.ProfilePhoto = User.ProfilePhoto;
            UserToBeUpdated.FirstName = User.FirstName;
            UserToBeUpdated.LastName = User.LastName;

            await _unitOfWork.CommitAsync();
        }

        public async Task<AuthenticateReturn> IsAuthenticated(LoginRequest model)
        {
            string error = "";
            try
            {
                var user = await _unitOfWork.Users.GetUserByUserIdAsync(model.UserName);
                if (user != null)
                {
                    if (user.ClientAccount.IsAccountActive)
                    {
                        if (user.IsAccountActive)
                        {
                            var isVarified = PasswordHashing.VerifyPassword(model.Password, user.Password);
                            return new AuthenticateReturn { UserID = user.Id, isAuthenticate = isVarified, error = error };
                        }
                        else
                        {
                            error = "Your account is not active.";
                            return new AuthenticateReturn { isAuthenticate = false, error = error };
                        }
                    }
                    else
                    {
                        error = "Your Clientaccount is not active.";
                        return new AuthenticateReturn { isAuthenticate = false, error = error };
                    }

                }
                else
                {
                    error = "Account not found.";
                    return new AuthenticateReturn { isAuthenticate = false, error = error };
                }
            }
            catch (Exception ex)
            {

                error = "Account not found.";
                return new AuthenticateReturn { isAuthenticate = false, error = error };
            }
            
        }

        public async Task<AuthenticateReturn> IsAuthenticated(ApiRequest model)
        {
            string error = "";
            var user = await _unitOfWork.Users.GetUserByApiKeyAsync(model.APIKey);
            if (user != null)
            {
                if (user.ClientAccount.IsAccountActive)
                {
                    if (user.IsAccountActive)
                    {
                        //var isVarified = PasswordHashing.VerifyPassword(model.Password, user.Password);
                        return new AuthenticateReturn { UserID = user.Id, UserName = user.UserId, isAuthenticate = true, error = error };
                    }
                    else
                    {
                        error = "Your account is not active.";
                        return new AuthenticateReturn { isAuthenticate = false, error = error };
                    }
                }
                else
                {
                    error = "Your Clientaccount is not active.";
                    return new AuthenticateReturn { isAuthenticate = false, error = error };
                }

            }
            else
            {
                error = "Account not found.";
                return new AuthenticateReturn { isAuthenticate = false, error = error };
            }
        }

        public async Task<int> GetUserRole(string userName)
        {
            var user = await _unitOfWork.Users.GetUserByUserIdAsync(userName);
            return user.RoleId;
        }

        public async Task<int> GetClientAccountId(string userName)
        {
            var user = await _unitOfWork.Users.GetClientAccountIdByUserIdAsync(userName);
            return user.ClientAccountId;
        }
    }
}
