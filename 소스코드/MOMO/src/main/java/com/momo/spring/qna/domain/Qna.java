package com.momo.spring.qna.domain;

public class Qna {

	private int QNAId;
	private String QUserId;
	private String AUserId;
	private String Q;
	private String A;
	
	private Qna() {}

	public Qna(int qNAId, String qUserId, String aUserId, String q, String a) {
		super();
		QNAId = qNAId;
		QUserId = qUserId;
		AUserId = aUserId;
		Q = q;
		A = a;
	}

	public int getQNAId() {
		return QNAId;
	}

	public void setQNAId(int qNAId) {
		QNAId = qNAId;
	}

	public String getQUserId() {
		return QUserId;
	}

	public void setQUserId(String qUserId) {
		QUserId = qUserId;
	}

	public String getAUserId() {
		return AUserId;
	}

	public void setAUserId(String aUserId) {
		AUserId = aUserId;
	}

	public String getQ() {
		return Q;
	}

	public void setQ(String q) {
		Q = q;
	}

	public String getA() {
		return A;
	}

	public void setA(String a) {
		A = a;
	}

	@Override
	public String toString() {
		return "QNA [QNAId=" + QNAId + ", QUserId=" + QUserId + ", AUserId=" + AUserId + ", Q=" + Q + ", A=" + A + "]";
	}
	
	
}
