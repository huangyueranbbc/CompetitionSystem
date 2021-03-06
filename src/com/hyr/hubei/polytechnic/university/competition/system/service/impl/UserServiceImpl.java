package com.hyr.hubei.polytechnic.university.competition.system.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import com.hyr.hubei.polytechnic.university.competition.system.base.DaoSupportImpl;
import com.hyr.hubei.polytechnic.university.competition.system.domain.User;
import com.hyr.hubei.polytechnic.university.competition.system.service.UserService;
import com.hyr.hubei.polytechnic.university.competition.system.utils.AppException;

@Service("userServiceImpl")
@Transactional
public class UserServiceImpl extends DaoSupportImpl<User> implements UserService {

	public void save(User user) throws AppException {
		// 设置密码为666666(默认) 进行MD5加密
		String md5Password = DigestUtils.md5Hex("666666");
		user.setPassword(md5Password);

		// 保存到数据库
		getSession().save(user);
	}

	/**
	 * 验证用户名与密码，如果正确就返回这个用户，否则返回空
	 * 
	 * @param loginName
	 *            登录名
	 * @param password
	 *            登录明文密码
	 * @return
	 * @throws AppException
	 */
	public User findByLoginNameAndPassword(String loginName, String password) throws AppException {
		// MD5加密
		String md5Password = DigestUtils.md5Hex(password);
		return (User) getSession().createQuery("FROM User u WHERE u.username = ? AND u.password= ? ")
				.setParameter(0, loginName).setParameter(1, md5Password).uniqueResult();
	}

	@Override
	public List<User> findAllActivityUser() throws AppException {
		// 注意空格！
		return getSession().createQuery("FROM " + clazz.getSimpleName() + " u AND u.isDelete = 0").list();
	}

}
