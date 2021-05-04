package com.kh.onepart.manager.vote.model.vo;

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
    private String endDt;
    private String voteStatus;
    private String userStatus;
    private String realEndDt;

}
