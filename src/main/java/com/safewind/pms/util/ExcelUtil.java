package com.safewind.pms.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by lxy on 2017/4/24.
 */
public class ExcelUtil {

    public static byte[] getExcelBytes(String name, String type , String standardCode , String standard, int count, Date date) {
        String[] title = {"名称","类型","标准号","规格","数量","截止时间"};

        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表sheet
        HSSFSheet sheet = workbook.createSheet();
        //创建第一行
        HSSFRow row =  sheet.createRow(0);
        HSSFCell cell = null;

        //插入第一行数据
        for (int i = 0; i < title.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            sheet.setColumnWidth(i,18*256);
        }
        //数据
        cell = row.createCell(0);
        cell.setCellValue(name);
        cell = row.createCell(1);
        cell.setCellValue(type);
        cell = row.createCell(2);
        cell.setCellValue(standardCode);
        cell = row.createCell(3);
        cell.setCellValue(standard);
        cell = row.createCell(4);
        cell.setCellValue(count);
        cell = row.createCell(5);
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        cell.setCellValue(format.format(date));





        byte[] bytes =  workbookTobytes(workbook);

        return bytes;
    }









    private static byte[] workbookTobytes(HSSFWorkbook workbook) {

        ByteArrayOutputStream baos =null;
        ByteArrayInputStream excelStream = null;
        byte[] aa = null;
        try {

            baos = new ByteArrayOutputStream();
            workbook.write(baos);
            baos.flush();
            aa = baos.toByteArray();
            baos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if (baos!=null){
                    baos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return aa;
    }
}
