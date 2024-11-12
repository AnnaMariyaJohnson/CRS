from django.shortcuts import render
from .models import *
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import logout
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.conf import settings
import datetime
from django.db.models import Q
from campusrecruitment.utils import render_to_pdf

# Create your views here.
def index(request):
    var = Tbl_jobrequest.objects.all().filter(status='selected')
    return render(request,'index.html',{'var':var})
def about(request):
    return render(request,'about.html')
def contact(request):
    return render(request,'contact.html')
def student_register(request):
    if request.method == "POST":
        name = request.POST['name']
        phone = request.POST['phone']
        email = request.POST['email']
        pswd = request.POST['pswd']
        qualification=request.POST['qualification']
        aa = Tbl_User(qualification=qualification,name=name, phone=phone, email=email, pswd=pswd, status='pending', user_type='student')
        aa.save()
        return render(request, 'index.html')
    else:
        return render(request,'student_register.html')

def signup(request):
    if request.method == "POST":
        name = request.POST['name']
        phone = request.POST['phone']
        email = request.POST['email']
        pswd = request.POST['pswd']
        website=request.POST['website']
        aa = Tbl_company(name=name, phone=phone, email=email, pswd=pswd, status='pending', user_type='company',website=website)
        aa.save()
        return render(request, 'index.html')
    else:
        return render(request,'index.html')

def login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["pswd"]
        chk = Tbl_User.objects.filter(email=email, pswd=password, user_type="admin")
        chk2 = Tbl_company.objects.filter(email=email, pswd=password, user_type="company",status='approved')
        chk3 = Tbl_User.objects.filter(email=email, pswd=password, user_type="student")
        if chk:
            for x in chk:
                request.session['id'] = x.id
            return render(request, 'Admin/admin_home.html')
        elif chk2:
            for x in chk2:
                request.session['id']=x.id
            return HttpResponseRedirect('/cmpny_home/')
            # return render(request,'company/company_home.html')
        elif chk3:
            for x in chk3:
                request.session['id']=x.id
            return HttpResponseRedirect('/student_home/')
            # return render(request,'student/student_home.html')

        else:
            return render(request, 'index.html', {'msg': 'Invalid login credentials.!'})
    else:
        return render(request,'index.html')

def logout(request):
    if request.session.has_key('id'):
        del request.session['id']
        logout(request)
    return HttpResponseRedirect('/')
def admin_home(request):
    return render(request,'Admin/admin_home.html')

def admin_userlist(request):
    userlist = Tbl_company.objects.all().filter(user_type='company', status='pending')
    userlist2 = Tbl_company.objects.all().filter(user_type='company', status='approved')
    return render(request, 'Admin/admin_userlist.html', {'userlist': userlist, 'userlist2': userlist2})

def admin_aprove_users(request):
    ii = request.GET['id']
    var = Tbl_company.objects.all().filter(id=ii).update(status='approved')
    return HttpResponseRedirect('/admin_userlist/')

def admin_reject_users(request):
	ii=request.GET['id']
	var=Tbl_company.objects.all().filter(id=ii).update(status='rejected')
	return HttpResponseRedirect('/admin_userlist/')

def admin_viewpost(request):
    cmpny =Tbl_jobpost.objects.all().filter(status='pending')
    cmpny2 =Tbl_jobpost.objects.all().filter(status='approved')
    return render(request,'Admin/admin_viewpost.html',{'cmpny':cmpny,'cmpny2':cmpny2})
def admin_approvepost(request):
    ii=request.GET['id']
    cmpny=Tbl_jobpost.objects.all().filter(id=ii).update(status='approved')
    return HttpResponseRedirect('/admin_viewpost/')
def admin_rejectpost(request):
    ii=request.GET['id']
    cmpny=Tbl_jobpost.objects.all().filter(id=ii).update(status='reject')
    return HttpResponseRedirect('/admin_viewpost/')
def admin_feedback(request):
    var=Tbl_feedback.objects.all().filter(utype='student')
    var2= Tbl_feedback.objects.all().filter(utype='company')
    return render(request,'Admin/admin_feedback.html',{'var':var,'var2':var2})

def admin_reports(request):
    var=Tbl_jobrequest.objects.all()
    return render(request,'Admin/admin_reports.html',{'var':var})

def download_as_pdf(request):
    # ii=request.GET['id']
    # print("------ii--------",ii)
    var = Tbl_jobrequest.objects.all()
    pdf = render_to_pdf('Admin/pdf.html', {'var': var})
    response = HttpResponse(pdf, content_type="application/pdf")
    response['Content-Disposition'] = 'attachment; filename=Report.pdf'
    return response

#--------------------company------------------------
def cmpny_home(request):
    user = Tbl_company.objects.get(id=request.session.get('id'))
    name = user.name
    return render(request,'company/company_home.html',{'name':name})
def cmpny_addpost(request):
    cid=request.session['id']
    if request.method == "POST":
        role = request.POST['role']
        experience = request.POST['experience']
        qualification = request.POST['qualification']
        skills = request.POST['skills']
        requirements = request.POST['requirements']
        cmpny=Tbl_company.objects.get(id=cid)
        aa = Tbl_jobpost(cmpny=cmpny,role=role, experience=experience, qualification=qualification, skills=skills, requirements=requirements, status='pending')
        aa.save()
        return HttpResponseRedirect('/cmpny_viewpost/')
    else:
        return render(request,'company/company_addpost.html')
def cmpny_viewpost(request):
    myid=request.session['id']
    cmpny =Tbl_jobpost.objects.all().filter(cmpny=myid)
    return render(request,'company/company_viewpost.html',{'cmpny':cmpny})
def cmpny_deletepost(request):
    ii=request.GET['id']
    Tbl_jobpost.objects.all().filter(id=ii).delete()
    return HttpResponseRedirect('/cmpny_viewpost/')
def cmpny_candidate(request):
    myid = request.session['id']
    qualif=[]
    user=Tbl_User.objects.all()
    for i in user:
        qual = i.qualification
        qualif.append(qual)
    if request.method=='POST':
        cat = request.POST['qualif']
        if cat == 'All':
            candidates = Tbl_jobrequest.objects.filter(cmp_id=myid)
        else:
            candidates = Tbl_jobrequest.objects.filter(cmp_id=myid,user_id_id__qualification=cat)
    else:
        candidates = Tbl_jobrequest.objects.filter(cmp_id=myid)
    return render(request,'company/compny_candidates.html',{'candidates':candidates,'qualif':qualif})

def company_approve_candidate(request):
    myid=request.session['id']
    ii=request.GET['id']
    candidates=Tbl_jobrequest.objects.all().filter(id=ii).update(status='approved')
    return HttpResponseRedirect('/cmpny_candidate/')

def company_reject_candidate(request):
	myid=request.session['id']
	ii=request.GET['id']
	candidates=Tbl_jobrequest.objects.all().filter(id=ii).update(status='reject')
	return HttpResponseRedirect('/cmpny_candidate/')

def cmpny_shortlisted_candidate(request):
    myid = request.session['id']
    candidates = Tbl_jobrequest.objects.filter(cmp_id=myid,status='approved')
    return render(request,'company/compny_shortlisted_candidate.html',{'candidates':candidates})

def cmpny_interviewd_candidates(request):
    myid = request.session['id']
    candidates = Tbl_jobrequest.objects.filter(cmp_id=myid,status='scheduled')
    return render(request,'company/compny_interviewd_candidates.html',{'candidates':candidates})

def company_select_candidate(request):
	myid=request.session['id']
	ii=request.GET['id']
	candidates=Tbl_jobrequest.objects.all().filter(id=ii).update(status='selected')
	return HttpResponseRedirect('/cmpny_candidate/')
def cmpny_schedule_interview(request):
    myid = request.session['id']
    if request.method=='POST':
        idd=request.POST['ii']
        interview_date=request.POST['interview_date']
        interview_time=request.POST['interview_time']
        interview_location=request.POST['interview_location']
        Tbl_jobrequest.objects.filter(id=idd).update(interview_date=interview_date,interview_time=interview_time,interview_location=interview_location,status='scheduled')

        job=Tbl_jobrequest.objects.all().filter(id=idd)
        # user_email = job.user_id.email
        # company_website = job.cmp_id.website
        for x in job:
            uid = x.user_id.id
            uemail = x.user_id.email
            website = x.cmp_id.website
            cmp_name = x.cmp_id.name
        subject = 'Interview Invitation'
        message = (
            f'Hi,\n\nThank you for your application. '
            f'You have been invited for an interview.\n\n'
            f'Interview Date: {interview_date}\n'
            f'Interview Time: {interview_time}\n'
            f'Interview Location: {interview_location}\n'
            f'Company : {cmp_name}, {website}\n\n'
            'Best regards,\nYour Company '
        )
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [uemail, ]
        print("mail sent")
        send_mail(subject, message, email_from, recipient_list)
        return HttpResponseRedirect('/cmpny_candidate/')
    else:
        ii = request.GET['id']
    return render(request,'company/compny_schedule_interview.html',{'ii':ii})

def cmpny_feedback(request):
    if request.method=="POST":
        myid=request.session['id']
        date=datetime.date.today()
        feedback=request.POST['feedback']
        cid=Tbl_company.objects.get(id=myid)
        Tbl_feedback(date=date,feedback=feedback,status='pending',cmpny=cid,utype='company').save()
        return HttpResponseRedirect('/cmpny_home/')
    else:
        return render(request,'company/company_feedback.html')

#-------------student--------------------
def student_home(request):
    user = Tbl_User.objects.get(id=request.session.get('id'))
    name = user.name
    return render(request,'student/student_home.html',{'name':name})
def student_profile(request):
    sid=request.session['id']
    var=Tbl_User.objects.all().filter(id=sid)
    return render(request,'student/student_profile.html',{'var':var})

def student_viewjob(request):
    myid = request.session['id']
    applyjob = Tbl_jobrequest.objects.all().filter(user_id=myid)
    jobid=[]
    if applyjob:
        for y in applyjob:
            # jobid = y.job_id.id
            jobid.append(y.job_id.id)
        print("------job---",jobid)
        var = Tbl_jobpost.objects.all().filter(status='approved')
        return render(request,'student/student_viewjob.html',{'var':var,'jobid':jobid,'applyjob':applyjob})
    else:
        var = Tbl_jobpost.objects.all().filter(status='approved')
        return render(request, 'student/student_viewjob.html', {'var': var, 'applyjob': applyjob})
def student_uploadcv(request):
    myid = request.session['id']
    if request.method == 'POST':
        jid= request.POST['idd']
        resume = request.FILES['resume']
        tdate = datetime.date.today()
        job_id = Tbl_jobpost.objects.get(id=jid)
        uid = Tbl_User.objects.get(id=myid)
        cmpny = Tbl_jobpost.objects.all().filter(id=jid)
        for i in cmpny:
            cmpid = i.cmpny.id
        cmp = Tbl_company.objects.get(id=cmpid)
        Tbl_jobrequest(resume=resume,date=tdate,user_id=uid,job_id=job_id,cmp_id=cmp,status='pending').save()
        return HttpResponseRedirect('/student_viewjob/')
    else:
        idd = request.GET['id']
        return render(request,'student/student_uploadcv.html',{'idd':idd})

def student_shortlists(request):
    myid = request.session['id']
    applyjob = Tbl_jobrequest.objects.all().filter(user_id=myid,status='scheduled')
    applyjob2 = Tbl_jobrequest.objects.all().filter(user_id=myid)
    return render(request,'student/student_shortlists.html',{'applyjob':applyjob,'applyjob2':applyjob2})

def student_feedback(request):
    if request.method=="POST":
        myid=request.session['id']
        date=datetime.date.today()
        feedback=request.POST['feedback']
        uid=Tbl_User.objects.get(id=myid)
        Tbl_feedback(date=date,feedback=feedback,status='pending',user=uid,utype='student').save()
        return HttpResponseRedirect('/student_home/')
    else:
        return render(request,'student/student_feedback.html')