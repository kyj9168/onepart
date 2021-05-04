package com.kh.onepart.manager.employee_manage.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmployeeManageVO {
	private String managerSeq;
	private String managerNm;
	private int deptCd;
	private String managerId;
	private String managerPwd;
	private String managerPhone;
	private String managerEmail;
	private Date managerEnrollDt;
	private Date managerLeaveDt;
	private String managerLeaveTf;

	private String deptNm;

}
