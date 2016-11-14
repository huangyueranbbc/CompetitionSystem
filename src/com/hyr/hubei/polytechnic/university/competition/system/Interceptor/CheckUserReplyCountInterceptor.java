package com.hyr.hubei.polytechnic.university.competition.system.Interceptor;

import javax.annotation.Resource;

import com.hyr.hubei.polytechnic.university.competition.system.domain.User;
import com.hyr.hubei.polytechnic.university.competition.system.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * @category 更新用户消息字段
 * @author huangyueran
 *
 */
public class CheckUserReplyCountInterceptor extends AbstractInterceptor {
	@Resource(name = "userServiceImpl")
	protected UserService userService;

	public String intercept(ActionInvocation invocation) throws Exception {
		// System.out.println("============> 拦截器（前） <============");
		// String result = invocation.invoke(); // 放行
		// System.out.println("============> 拦截器（后） <============");
		// return result;

		// a, 当前登录的用户
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (user != null) {
			User user2 = userService.getById(user.getId());
			// 将用户消息记录数存入
			ActionContext.getContext().getSession().put("userReplysCount", user2.getReplysCount());
		}

		return invocation.invoke();
	}
}
