from django.contrib import admin
from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index),
    path('about/',views.about),
    path('contact/',views.contact),
    path('signup/', views.signup),
    path('student_register/', views.student_register),
    path('login/', views.login),
    path('logout/',views.logout),

    #Admin
    path('admin_home/', views.admin_home),
    path('admin_userlist/', views.admin_userlist),
    path('admin_aprove_users/', views.admin_aprove_users),
    path('admin_reject_users/', views.admin_reject_users),
    path('admin_viewpost/', views.admin_viewpost),
    path('admin_approvepost/', views.admin_approvepost),
    path('admin_rejectpost/', views.admin_rejectpost),
    path('admin_feedback/', views.admin_feedback),
    path('admin_reports/', views.admin_reports),
    path('download_as_pdf/', views.download_as_pdf),


    #company
    path('cmpny_home/', views.cmpny_home),
    path('cmpny_addpost/', views.cmpny_addpost),
    path('cmpny_viewpost/', views.cmpny_viewpost),
    path('cmpny_deletepost/', views.cmpny_deletepost),
    path('cmpny_candidate/', views.cmpny_candidate),
    path('company_approve_candidate/', views.company_approve_candidate),
    path('company_reject_candidate/', views.company_reject_candidate),
    path('cmpny_shortlisted_candidate/', views.cmpny_shortlisted_candidate),
    path('cmpny_schedule_interview/', views.cmpny_schedule_interview),
    path('cmpny_feedback/', views.cmpny_feedback),
    path('cmpny_interviewd_candidates/', views.cmpny_interviewd_candidates),
    path('company_select_candidate/', views.company_select_candidate),


    #student
    path('student_home/', views.student_home),
    path('student_profile/', views.student_profile),
    path('student_viewjob/', views.student_viewjob),
    path('student_uploadcv/', views.student_uploadcv),
    path('student_shortlists/', views.student_shortlists),
    path('student_feedback/', views.student_feedback),

]
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)