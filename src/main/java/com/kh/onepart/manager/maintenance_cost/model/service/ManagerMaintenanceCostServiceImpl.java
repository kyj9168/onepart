package com.kh.onepart.manager.maintenance_cost.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.onepart.manager.maintenance_cost.model.dao.ManagerMaintenanceCostDao;
import com.kh.onepart.manager.maintenance_cost.model.vo.CostDay;
import com.kh.onepart.manager.maintenance_cost.model.vo.CostExcel;

@Service
public class ManagerMaintenanceCostServiceImpl implements ManagerMaintenanceCostService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ManagerMaintenanceCostDao mmcd;
	//단지내 내역별 총 관리비 리스트 받아오는 메소드
	@Override
	public ArrayList selectAllApartCostList() {

		ArrayList costList = mmcd.selectAllApartCostList(sqlSession);

		return costList;

	}
	//단지내 5달 관리비의 합계 리스트 가져오는 메소드
	@Override
	public ArrayList selectAllSumCostList() {

		ArrayList sumCostList = mmcd.selectAllSumCostList(sqlSession);

		return sumCostList;

	}
	//xlsxExcelReader insert 메소드
	@Override
	public List<CostExcel> xlsxExcelReader(MultipartHttpServletRequest req, CostDay day) {

		List<CostExcel> list = new ArrayList<>();

		MultipartFile file = req.getFile("files");
		XSSFWorkbook workbook = null;

		try {
			workbook = new XSSFWorkbook(file.getInputStream());

			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			CostExcel vo;

			System.out.println("workbook.getNumberOfSheets() :: " + workbook.getNumberOfSheets());
			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
			// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				System.out.println("curSheet.getPhysicalNumberOfRows() :: " + curSheet.getPhysicalNumberOfRows());
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					System.out.println("row 탐색...");
				// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != -1) {
					System.out.println("rowIndex :: " + rowIndex);
					curRow = curSheet.getRow(rowIndex);
					vo = new CostExcel();
					String value;
					String result;
					String[] arr;
						System.out.println("curRow.getCell(0) :: " + curRow.getCell(0));
						// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (0 !=  curRow.getCell(0).getNumericCellValue()) {
								System.out.println("cell 탐색...");
								System.out.println("curRow.getPhysicalNumberOfCells() :: " + curRow.getPhysicalNumberOfCells());
							// cell 탐색 for문
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
								curCell = curRow.getCell(cellIndex);
									if (true) {
										value = "";
										result = "";
										arr = null;
										// cell 스타일이 다르더라도 String으로 반환 받음
										switch (curCell.getCellType()) {
										case HSSFCell.CELL_TYPE_FORMULA:
										value = curCell.getCellFormula();
										System.out.println("sevice value :: " + value);
										arr = value.split("[.]");
										for(int i = 0; i < arr.length; i++) {
											System.out.println("arr :: " + arr[i]);
										}
										if(arr[0].length() != 0) {
											result = arr[0];
											System.out.println("service arr[0] :: " + arr[0]);
										}else {
											result = value;
											System.out.println("service result :: " + result);
										}
										System.out.println("service value :: " + result);
										break;
										case HSSFCell.CELL_TYPE_NUMERIC:
										value = curCell.getNumericCellValue() + "";
										arr = value.split("[.]");
										for(int i = 0; i < arr.length; i++) {
											System.out.println("arr :: " + arr[i]);
										}
										System.out.println("service arr :: " + arr);
										if(arr[0].length() != 0) {
											result = arr[0];
											System.out.println("service arr[0] :: " + arr[0]);
										}else {
											result = value;
											System.out.println("service result :: " + result);
										}
										System.out.println("service value :: " + result);
										break;
										case HSSFCell.CELL_TYPE_STRING:
										value = curCell.getStringCellValue() + "";
										arr = value.split("[.]");
										for(int i = 0; i < arr.length; i++) {
											System.out.println("arr :: " + arr[i]);
										}
										if(arr[0].length() != 0) {
											result = arr[0];
											System.out.println("service arr[0] :: " + arr[0]);
										}else {
											result = value;
											System.out.println("service result :: " + result);
										}
										System.out.println("service value :: " + result);
										break;
										case HSSFCell.CELL_TYPE_BLANK:
										value = curCell.getBooleanCellValue() + "";
										arr = value.split("[.]");
										for(int i = 0; i < arr.length; i++) {
											System.out.println("arr :: " + arr[i]);
										}
										if(arr[0].length() != 0) {
											result = arr[0];
											System.out.println("service arr[0] :: " + arr[0]);
										}else {
											result = value;
											System.out.println("service result :: " + result);
										}
										System.out.println("service value :: " + result);
										break;
										case HSSFCell.CELL_TYPE_ERROR:
										value = curCell.getErrorCellValue() + "";
										arr = value.split("[.]");
										for(int i = 0; i < arr.length; i++) {
											System.out.println("arr :: " + arr[i]);
										}
										if(arr[0].length() != 0) {
											result = arr[0];
											System.out.println("service arr[0] :: " + arr[0]);
										}else {
											result = value;
											System.out.println("service result :: " + result);
										}
										System.out.println("service value :: " + result);
										break;
										default:
										value = new String();
										break;
										} // end switch

										// 현재 colum index에 따라서 vo입력
										switch (cellIndex) {
										case 0: // 아이디
										vo.setCategory(Integer.parseInt(result));
										break;
										case 1: // 이름
										vo.setMoney(Integer.parseInt(result));
										break;
										default:
										break;
										}
									} // end if
								} // end for
							// cell 탐색 이후 vo 추가
							vo.setExcelYear(day.getExcelYear());
							vo.setExcelMonth(day.getExcelMonth());
							vo.setInsertDay(day.getInsertDay());
							list.add(vo);
							} // end
						} // end if
					}

				}
			}

			System.out.println("service list :: " + list);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("day", day);

			//excel insert
			for(int i = 0; i < list.size(); i++) {
				int result = mmcd.insertExcelMaintenanceCost(sqlSession, list.get(i));
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	//xlsExcelReader insert 메소드
	@Override
	public List<CostExcel> xlsExcelReader(MultipartHttpServletRequest req, CostDay day) {
		// TODO Auto-generated method stub
		return null;
	}


}
