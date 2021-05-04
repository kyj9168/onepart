package com.kh.onepart.resident.my_apartment.vote.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VoteList implements java.io.Serializable{

    private int voteSeq;
    private String voteKind;
    private String voteNm;
    private Date startDt;
    private Date endDt;
    private String voteStatus;
    private String userStatus;
    private String realEndDt;
    private String detailInfo;
    private int residentSeq;
    private int candidateSeq;

}
