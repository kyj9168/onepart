package com.kh.onepart.resident.my_home.my_car.model.service;

import java.util.List;
import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.my_home.my_car.model.vo.MyCar;

public interface MyCarService {


	public List<MyCar> getMyCarList(int residentSeq);

}
