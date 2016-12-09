package springBootDemo.util;

import org.apache.commons.lang3.StringUtils;

/**
 * 拼写类型转换工具
 * Created by lx on 2016/12/09
 */
public class SpellUtils {

    /**
     * 转成帕斯卡拼写方法（每个单词首字母大写，没有连接符） 
     * @param name---例如 name_age ----> NameAge     
     * @return
     */
    public static String toPascalCase(String name) {
        StringBuilder result = new StringBuilder();
        boolean needUpper = false;
        if (StringUtils.isNotEmpty(name)) {
            result.append(Character.toUpperCase(name.charAt(0)));
            for (int i = 1; i < name.length(); i++) {
                String s = String.valueOf(name.charAt(i));
                if (s.equals("_")) {
                    needUpper = true;
                } else {
                    if (needUpper) {
                        result.append(s.toUpperCase());
                        needUpper = false;
                    } else {
                        result.append(s.toLowerCase());
                    }
                }
            }
        }
        return result.toString();
    }


    /**
     * 转成驼峰表示法
     * @param name
     * @return
     */
    public static String toCamelCase(String name){
        StringBuilder result = new StringBuilder();
        boolean needUpper = false;
        if (StringUtils.isNotEmpty(name)) {
            result.append(name.charAt(0));
            for (int i = 1; i < name.length(); i++) {
                String s = String.valueOf(name.charAt(i));
                if (s.equals("_")) {
                    needUpper = true;
                } else {
                    if (needUpper) {
                        result.append(s.toUpperCase());
                        needUpper = false;
                    } else {
                        result.append(s.toLowerCase());
                    }
                }
            }
        }
        return result.toString();
    }
}
