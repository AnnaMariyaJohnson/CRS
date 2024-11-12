from django.db import models

# Create your models here.
class Tbl_User(models.Model):
	name=models.CharField(max_length=30,default='')
	qualification=models.CharField(max_length=50,default='')
	phone=models.CharField(max_length=50,default='')
	email=models.CharField(max_length=30,default='')
	pswd=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')
	# website=models.CharField(max_length=30,default='')
	user_type=models.CharField(max_length=30,default='')

class Tbl_company(models.Model):
	name=models.CharField(max_length=30,default='')
	phone=models.CharField(max_length=50,default='')
	email=models.CharField(max_length=30,default='')
	pswd=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')
	website=models.CharField(max_length=30,default='')
	user_type=models.CharField(max_length=30,default='company')

class Tbl_jobpost(models.Model):
	role=models.CharField(max_length=30,default='')
	experience=models.CharField(max_length=50,default='')
	qualification=models.CharField(max_length=30,default='')
	skills=models.CharField(max_length=30,default='')
	requirements=models.CharField(max_length=30,default='')
	joblocation = models.CharField(max_length=100, default='')
	responsibilities = models.CharField(max_length=100, default='')
	salary = models.CharField(max_length=100, default='')
	status=models.CharField(max_length=30,default='')
	upload_date = models.CharField(max_length=100, default='')
	end_date = models.CharField(max_length=100, default='')
	cmpny=models.ForeignKey(Tbl_company,on_delete=models.CASCADE, blank=True,null=True)

class Tbl_jobrequest(models.Model):
	resume=models.ImageField(upload_to='resume/',default='')
	date=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='')
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	job_id=models.ForeignKey(Tbl_jobpost,on_delete=models.CASCADE, blank=True,null=True)
	cmp_id=models.ForeignKey(Tbl_company,on_delete=models.CASCADE, blank=True,null=True)
	interview_date=models.CharField(max_length=100,default='')
	interview_time=models.CharField(max_length=100,default='')
	interview_location=models.CharField(max_length=100,default='')

class Tbl_feedback(models.Model):
	date=models.CharField(max_length=30,default='')
	feedback=models.CharField(max_length=50,default='')
	user=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	cmpny=models.ForeignKey(Tbl_company,on_delete=models.CASCADE, blank=True,null=True)
	status=models.CharField(max_length=30,default='')
	utype=models.CharField(max_length=30,default='')
