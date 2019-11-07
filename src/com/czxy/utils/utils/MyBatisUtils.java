package com.czxy.utils.utils;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;
import tk.mybatis.mapper.entity.Config;
import tk.mybatis.mapper.mapperhelper.MapperHelper;

public class MyBatisUtils {
	//会话工厂
	private static SqlSessionFactory factory;
	/**初始化：会话工厂*/
	static{
		try{
			//1、获取资源流
			InputStream is = Resources.getResourceAsStream("SqlMapConfig.xml");
			//2、获取会话工厂
			factory = new SqlSessionFactoryBuilder().build(is);
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	/**使用ThreadLocal，管理某个线程的SqlSession*/
	private static ThreadLocal<SqlSession> local = new ThreadLocal<SqlSession>();
	/**获取新会话*/
	public static SqlSession openSession(){
		SqlSession session = null;
		session = local.get();
		if(session==null){
			session = factory.openSession();
			//创建一个MapperHelper
	        MapperHelper mapperHelper = new MapperHelper();
	        //特殊配置
	        Config config = new Config();
	        // 设置UUID生成策略
	        // 配置UUID生成策略需要使用OGNL表达式
	        // 默认值32位长度:@java.util.UUID@randomUUID().toString().replace("-", "")
	        //config.setUUID("");
	        // 主键自增回写方法,默认值MYSQL,详细说明请看文档
//	        config.setIDENTITY("HSQLDB");
	        // 支持方法上的注解
	        // 3.3.1版本增加
	        config.setEnableMethodAnnotation(true);
	        config.setNotEmpty(true);
	        // 序列的获取规则,使用{num}格式化参数，默认值为{0}.nextval，针对Oracle
	        // 可选参数一共3个，对应0,1,2,分别为SequenceName，ColumnName, PropertyName
	        //config.setSeqFormat("NEXT VALUE FOR {0}");
	        // 设置全局的catalog,默认为空，如果设置了值，操作表时的sql会是catalog.tablename
	        //config.setCatalog("");
	        // 设置全局的schema,默认为空，如果设置了值，操作表时的sql会是schema.tablename
	        // 如果同时设置了catalog,优先使用catalog.tablename
	        //config.setSchema("");
	        // 主键自增回写方法执行顺序,默认AFTER,可选值为(BEFORE|AFTER)
	        //config.setOrder("AFTER");
	        //设置配置
	        mapperHelper.setConfig(config);
	        // 注册通用Mapper接口 - 可以自动注册继承的接口
	        mapperHelper.registerMapper(Mapper.class);
	        mapperHelper.registerMapper(MySqlMapper.class);
//	        mapperHelper.registerMapper(SqlServerMapper.class);
//	        mapperHelper.registerMapper(IdsMapper.class);
	        //配置完成后，执行下面的操作
	        mapperHelper.processConfiguration(session.getConfiguration());

			local.set(session);
		}
		return session;
	}
	/**关闭会话*/
	public static void close(){
		SqlSession session = local.get();
		if(session!=null){
			session.close();
			//不删除会导致线程再次使用到一个关闭的SqlSession会话
			local.remove();
		}
	}
	/**提交并关闭事务*/
	public static void commitAndClose(){
		SqlSession session = local.get();
		if(session!=null){
			session.commit();
			close();
		}
	}
	/**回滚并关闭事务*/
	public static void rollbackAndClose(){
		SqlSession session = local.get();
		if(session!=null){
			session.rollback();
			close();
		}
	}
	/**获取Mapper 
	 * 注：若session已被关闭，必须重新调用getMapper获取新的Dao对象
	 * */
	public static <T> T getMapper(Class<T> clazz){
		return openSession().getMapper(clazz);
	}
}
