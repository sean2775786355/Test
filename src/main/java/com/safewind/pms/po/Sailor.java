package com.safewind.pms.po;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Sailor {
	
	private Long id;					//id值
	
	private String sailor_id;			//船员编号
	
	private String name;				//姓名
	
	private String e_name;				//英文名
	
	private int sex;					//性别：0.男；1.女
	
	private int duty;					//职务：0.水手；1.船长；2.大副；3.二副；4.三副；5.水手长；6.轮机长；7.大管轮；8.二管轮；9.三管轮；10.机工；11.机匠；12.实习生；13.大厨；14.二厨；15.电机员；16.船医；17.政委；18.铜匠；19.木匠；80.其他1；81.其他2；82.其他3；83.岸基管理员；99.面试生
	
	private Date birth;					//出生日期
	
	private String native_place;		//籍贯
	
	private int edu;					//文化程度：0.小学；1.初中；2.高中；3.职高；4.本科；5.大专；6.硕士；7.博士；8.未受过教育
	
	private int length;					//身高cm
	
	private int weight;					//体重kg
	
	private String blood_type;			//血型：A,B,O,AB
	
	private String school;				//毕业学校
	
	private String major;				//专业
	
	private	Date gra_time;				//毕业时间
	
	private String email;				//电子邮箱
	
	private String address;				//家庭地址
	
	private long phone;					//联系电话
	
	private int marriage;				//婚姻状况：0.未婚；1.已婚
	
	private int health;					//健康状况：0.健康；1.不健康

	private String id_num;				//身份证号
	
	
	/**
	 * 亲属1信息
	 */
	private String relationship_name;	//亲属1姓名
	
	private int relationship;			//关系1：0.父；1.母；2.配偶；3.子女；4.其他
	
	private long relationship_phone;	//亲属1联系电话
	
	private String relationship2_name;	//亲属2姓名
	
	private int relationship2;			//关系2：0.父；1.母；2.配偶；3.子女；4.其他
	
	private long relationship2_phone;	//亲属2联系电话
	
	private byte is_del;  				//是否删除
	
	private String content;				//其他说明

	
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getSailor_id() {
		return sailor_id;
	}

	public void setSailor_id(String sailor_id) {
		this.sailor_id = sailor_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getDuty() {
		return duty;
	}

	public void setDuty(int duty) {
		this.duty = duty;
	}

	

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getNative_place() {
		return native_place;
	}

	public void setNative_place(String native_place) {
		this.native_place = native_place;
	}

	public int getEdu() {
		return edu;
	}

	public void setEdu(int edu) {
		this.edu = edu;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getBlood_type() {
		return blood_type;
	}

	public void setBlood_type(String blood_type) {
		this.blood_type = blood_type;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	
	
	public Date getGra_time() {
		return gra_time;
	}

	public void setGra_time(Date gra_time) {
		this.gra_time = gra_time;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public int getMarriage() {
		return marriage;
	}

	public void setMarriage(int marriage) {
		this.marriage = marriage;
	}

	public int getHealth() {
		return health;
	}

	public void setHealth(int health) {
		this.health = health;
	}

	public String getId_num() {
		return id_num;
	}

	public void setId_num(String id_num) {
		this.id_num = id_num;
	}

	public String getRelationship_name() {
		return relationship_name;
	}

	public void setRelationship_name(String relationship_name) {
		this.relationship_name = relationship_name;
	}

	public int getRelationship() {
		return relationship;
	}

	public void setRelationship(int relationship) {
		this.relationship = relationship;
	}

	public long getRelationship_phone() {
		return relationship_phone;
	}

	public void setRelationship_phone(long relationship_phone) {
		this.relationship_phone = relationship_phone;
	}

	public String getRelationship2_name() {
		return relationship2_name;
	}

	public void setRelationship2_name(String relationship2_name) {
		this.relationship2_name = relationship2_name;
	}

	public int getRelationship2() {
		return relationship2;
	}

	public void setRelationship2(int relationship2) {
		this.relationship2 = relationship2;
	}

	public long getRelationship2_phone() {
		return relationship2_phone;
	}

	public void setRelationship2_phone(long relationship2_phone) {
		this.relationship2_phone = relationship2_phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Sailor [id=" + id + ", sailor_id=" + sailor_id + ", name="
				+ name + ", e_name=" + e_name + ", sex=" + sex + ", duty="
				+ duty + ", birth=" + birth + ", native_place=" + native_place
				+ ", edu=" + edu + ", length=" + length + ", weight=" + weight
				+ ", blood_type=" + blood_type + ", school=" + school
				+ ", major=" + major + ", gra_time=" + gra_time + ", email="
				+ email + ", address=" + address + ", phone=" + phone
				+ ", marriage=" + marriage + ", health=" + health + ", id_num="
				+ id_num + ", relationship_name=" + relationship_name
				+ ", relationship=" + relationship + ", relationship_phone="
				+ relationship_phone + ", relationship2_name="
				+ relationship2_name + ", relationship2=" + relationship2
				+ ", relationship2_phone=" + relationship2_phone + ", content="
				+ content + ", getId()=" + getId() + ", getSailor_id()="
				+ getSailor_id() + ", getName()=" + getName()
				+ ", getE_name()=" + getE_name() + ", getSex()=" + getSex()
				+ ", getDuty()=" + getDuty() + ", getBirth()=" + getBirth()
				+ ", getNative_place()=" + getNative_place() + ", getEdu()="
				+ getEdu() + ", getLength()=" + getLength() + ", getWeight()="
				+ getWeight() + ", getBlood_type()=" + getBlood_type()
				+ ", getSchool()=" + getSchool() + ", getMajor()=" + getMajor()
				+ ", getGra_time()=" + getGra_time() + ", getEmail()="
				+ getEmail() + ", getAddress()=" + getAddress()
				+ ", getPhone()=" + getPhone() + ", getMarriage()="
				+ getMarriage() + ", getHealth()=" + getHealth()
				+ ", getId_num()=" + getId_num() + ", getRelationship_name()="
				+ getRelationship_name() + ", getRelationship()="
				+ getRelationship() + ", getRelationship_phone()="
				+ getRelationship_phone() + ", getRelationship2_name()="
				+ getRelationship2_name() + ", getRelationship2()="
				+ getRelationship2() + ", getRelationship2_phone()="
				+ getRelationship2_phone() + ", getContent()=" + getContent()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
}