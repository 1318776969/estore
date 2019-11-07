package com.czxy;

import org.junit.Test;

import java.util.Collections;
import java.util.LinkedList;

/**
 * Created by xps13 on 2019/5/21.
 */
public class Test01 {

    /**
     * 测试：浏览记录（ pid操作 ）
     * 需求：把44添加到字符串头部
     */
    @Test
    public void run1(){
        String str = "11,22,33,55,66,77";//cookie中的value
        //1、切割字符串，把字符串变为数组
        String[] arr = str.split(",");
        //2、把数组填充到LinkedList
        LinkedList<String> historyList = new LinkedList<>();
        Collections.addAll(historyList,arr);
        System.out.println(historyList);
        //3、尝试在集合中，删除之前该元素
        historyList.remove("44");
        // 如果元素长度==6，删除
        if(historyList.size()==6){
            historyList.removeLast();
        }
        //把数据追加到LinkedList头部
        historyList.addFirst("44");
        System.out.println(historyList);
        //4、重新拼接为一个字符串
        StringBuilder builder = new StringBuilder();
        for (String x : historyList) {
            builder.append(x+",");
        }
        //去掉最后的一个,
        builder.deleteCharAt(builder.length()-1);
        System.out.println(builder.toString());
    }
}
