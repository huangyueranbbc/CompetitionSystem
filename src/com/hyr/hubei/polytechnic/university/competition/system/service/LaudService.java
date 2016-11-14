package com.hyr.hubei.polytechnic.university.competition.system.service;

import javax.transaction.Transactional;

import com.hyr.hubei.polytechnic.university.competition.system.base.DaoSupport;
import com.hyr.hubei.polytechnic.university.competition.system.domain.Favorite;
import com.hyr.hubei.polytechnic.university.competition.system.domain.Laud;
import com.hyr.hubei.polytechnic.university.competition.system.domain.Role;

/**
 * @author huangyueran
 * @category 点赞Service接口
 */
@Transactional
public interface LaudService extends DaoSupport<Laud> {

}
