from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns = [
    # login  register logout
    path('login/', views.login, name="login"),
    path('register2/', views.register, name="register2"),
    path('logoutpag/', views.logoutpag, name="logoutpag"),


    # home
    path('', views.home, name="home"),
    path('home2/', views.home2, name="home2"),
    path('home3/', views.home3, name="home3"),

    # Leader
    path('leader/<str:pk>', views.leader, name='leader'),
    path('groupdoc/<str:pk>', views.groupdoc, name='groupdoc'),
    path('creategroup/<str:pk>', views.creategroup, name='creategroup'),
    path('updatedoc/useid:<int:pk1>/<int:pk2>', views.updatedoc, name="updatedoc"),
    path('removedoc2/<int:pk>', views.removedoc2, name='removedoc2'),
    path('updategroup/<int:pk>', views.updategroup, name='updategroup'),
    path('removegroup/<int:pk>', views.removegroup, name='removegroup'),
    path('download2/<int:pk>', views.download2, name='download2'),
    path('groupview/<int:pk>', views.groupview, name='groupview'),

    # Follower
    path('follower/<str:pk>', views.follower, name='follower'),
    path('mygroup/<str:pk>', views.mygroup, name='mygroup'),
    path('download/<int:pk>', views.download, name='download'),
    path('upload/<str:pk>', views.upload, name='upload'),
    path('removedoc/<int:pk>', views.removedoc, name='removedoc'),
    path('quitgroup/<str:pk>/<int:group>', views.quitgroup, name='quitgroup'),

    path('viewgroup/', views.viewgroup, name='viewgroup'),
    path('groupmsg/', views.groupmsg, name='groupmsg'),


    # superuser
    path('superuser/<str:pk>', views.superuser, name='superuser'),
    path('removeuser/<str:name>/<int:pk>', views.removeuser, name='removeuser'),

    path('error/', views.error, name='error'),
    path('resetmsg/', views.resetmsg, name='resetmsg'),
]

