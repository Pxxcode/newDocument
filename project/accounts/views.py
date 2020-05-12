from django.shortcuts import render,redirect,render_to_response
from django.http import HttpResponse, FileResponse,StreamingHttpResponse
from django.contrib.auth.forms import UserCreationForm
from django.utils.decorators import method_decorator

from .models import *
from . import filters, forms
from .decorator import *
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
# Create your views here.

#管理员主页面模板
def home(request):
    return render(request, 'accounts/main.html')
#领导员主页面模板
def home2(request):
    return render(request, 'accounts/main2.html')
#组员主页面模板
def home3(request):
    return render(request, 'accounts/main3.html')


# Login Register Logout

#登录
def login(request):
    if request.method == "POST":
        login_form = forms.CreateUserForm(request.POST)
        if login_form.is_valid():
            username = login_form.cleaned_data['name']
            password = login_form.cleaned_data['password']

            try:
                user = User.objects.get(name=username) ## 对比数据库

                if user.password == password:
                    request.session['is_login'] = True
                    request.session['name'] = username
                    request.session['id'] = user.id
                    request.session['authority'] = user.authority
                    if user.authority == '2':
                        return redirect('home2')
                    elif user.authority == '3':
                        return  redirect('home3')
                    else:
                        return redirect('home')

                else:
                    message = 'Password is incorrect'
            except:
                message = 'Account is not exist'
        return render(request, 'accounts/login.html', locals())
    login_form = forms.CreateUserForm()
    return render(request, 'accounts/login.html', locals())

#注册

def register(request):
    if request.session.get('is_login', None):
        return redirect("login")
    if request.method == "POST":
        register_form = forms.RegisterForm(request.POST)
        if register_form.is_valid():
            username = register_form.cleaned_data['name']
            password1 = register_form.cleaned_data['password1']
            password2 = register_form.cleaned_data['password2']
            email = register_form.cleaned_data['email']
            authority = register_form.cleaned_data['authority']
            if password1 != password2:
                message = 'Password and Confirm Password are not match'
                return render(request, 'accounts/register2.html', locals())
            else:
                same_name = User.objects.filter(name = username)
                if same_name:
                    message = "User already exists"
                    return render(request, 'accounts/register2.html', locals())
                same_email = User.objects.filter(email = email)
                if same_email:
                    message = "Email has been registered"
                    return render(request, 'accounts/register2.html', locals())
                new_user = User.objects.create()
                new_user.name = username
                new_user.password = password1
                new_user.email = email
                new_user.authority = authority
                new_user.save()
                return redirect('login')
    register_form = forms.RegisterForm()
    return render(request, 'accounts/register2.html', locals())

#登出
def logoutpag(request):
    request.session.flush()
    return redirect("login")
    # if not request.session.get('is_login', None):
    #     # 如果本来就未登录，也就没有登出一说
    #     return redirect("login")
    # request.session.flush()
    # # 或者使用下面的方法
    # # del request.session['is_login']
    # # del request.session['user_id']
    # # del request.session['user_name']
    # return redirect("login")


# Leader page

#领导者基本操作
@log_in
@authority2
def leader(request, pk):
    leader = User.objects.filter(name=pk)
    leader_msg = leader[0]
    leader_group_count = leader[0].group.all().count()
    group = leader[0].group.all()

    myFilter = filters.GroupFilter(request.GET, queryset=group)
    group = myFilter.qs

    context = {'leader':leader, 'leader_group_count':leader_group_count, 'group':group, 'myFilter':myFilter, 'leader_msg':leader_msg}
    return render(request, 'accounts/leader.html', context)

#对成员组中文件的操作
@log_in
@authority2
def groupdoc(request, pk):
    leader = User.objects.filter(name=pk)
    doc = Document.objects.all()
    allgroup_id = []

    for i in leader[0].group.all(): # 领导人所有的组
        allgroup_id.append(i.id)
    for i in doc:
        if i.group.id in allgroup_id:
            continue
        else:
            doc = doc.exclude(group_id=i.group.id)
            print(doc)
            group_doc = doc.exclude(group_id=i.group.id)
            print(group_doc)

    myFilter = filters.DocumentFilter2(request.GET, queryset=group_doc)
    group_doc = myFilter.qs

    context = {'group_doc': group_doc, 'myFilter': myFilter}
    return render(request, 'accounts/groupdoc.html', context)

#更新成员组中文件的状态
@log_in
@authority2
def updatedoc(request, pk1, pk2):
    doc = Document.objects.filter(id=pk2, use_id=pk1)
    form = forms.UpdateForm2()
    message = ''
    if request.method == "POST":
        form = forms.UpdateForm2(request.POST)
        if form.is_valid():
            status = form.cleaned_data['status']
            errormsg = form.cleaned_data['errormsg']
            doc.update(status = status, errormsg=errormsg)
            doc[0].save()
            message = 'Congratulations, successfully modified！'

    context = {'form': form, 'message': message}
    return render(request, 'accounts/updatedoc.html', context)

#移除成员组中文件
@log_in
@authority2
def removedoc2(request, pk):
    doc = Document.objects.get(id=pk)
    context = {'doc':doc}
    if request.method == "POST":
        doc.delete()
        return redirect('/groupdoc/'+doc.use.name)
    return render(request, 'accounts/removedoc2.html', context)

#更新组信息
@log_in
@authority2
def updategroup(request, pk):
    group = Group.objects.filter(id=pk)
    group_name = Group.objects.all()
    all_name=[]
    for i in group_name:
        all_name.append(i.name)
    print(all_name)
    form = forms.GroupForm2()
    message = ''
    if request.method == "POST":
        form = forms.GroupForm2(request.POST)
        if form.is_valid():
            name = form.cleaned_data['groupname']
            note = form.cleaned_data['note']
            if name not in all_name:
                group.update(name=name, note=note)
                group[0].save()
                message = 'Congratulations, successfully modified！'
            else:
                message = 'Sorry!Group with this Name already exists.'
    context = {'form': form, 'message': message}
    return render(request, 'accounts/updategroup.html', context)

#移除组
@log_in
@authority2
def removegroup(request, pk):
    group = Group.objects.get(id=pk)
    leader_name=group.user_set.filter(authority=2)[0].name
    if request.method == "POST":
        group.delete()
        return redirect('/leader/'+ leader_name)
    context = {'group': group}
    return render(request, 'accounts/removegroup.html', context)

#创建组
@log_in
@authority2
def creategroup(request, pk):
    leader = User.objects.filter(name=pk)
    form = forms.GroupForm()
    message = ''
    if request.method == "POST":
        form = forms.GroupForm(request.POST)  # 获取前端的数据加入表单
        if form.is_valid():
            name = form.cleaned_data['name']
            note = form.cleaned_data['note']
            form.save()
            leader[0].group.add(*(Group.objects.filter(name=name)))
            message = 'This Group ' + name + ' is created.Please go back and check about your group'

    context = {'form':form, 'message': message}
    return render(request, 'accounts/creategroup.html', context)

# 组信息查看
@log_in
@authority2
def groupview(request,pk):
    group = Group.objects.get(id=pk)
    members = group.user_set.all()
    count = members.count()-1
    context={'members': members, 'count':count}
    return render(request,'accounts/groupview.html',context)

# 下载文件
@log_in
@authority2
def download2(request,pk):
    form = Document.objects.get(id=pk)
    filename = form.doc
    if request.method == "POST":
        file = open('static/file/' + str(filename), 'rb')
        response = FileResponse(file)
        new_filename = 'attachment;filename= ' + str(filename)
        response['Content-Type'] = 'application/octet-stream'
        response['Content-Disposition'] = new_filename.encode('utf-8', 'ISO-8859-1')
        return response
    context = {'form':form}
    return render(request, 'accounts/download2.html',context)



# Follower page

# 组员基本操作
@log_in
@authority3
def follower(request, pk):
    follower = User.objects.filter(name=pk)
    leader = User.objects.filter(authority = '2') # 拿到领导者
    follower_doc = follower[0].document_set.all() #获取与该用户相关的文件


    #文件的三种状态
    status_pending = follower[0].document_set.filter(status = 'Pending').count()
    status_delivered = follower[0].document_set.filter(status='Delivered').count()
    status_error = follower[0].document_set.filter(status='Error').count()

    myFilter = filters.DocumentFilter(request.GET, queryset=follower_doc)
    follower_doc = myFilter.qs

    group_id = [] #所有组id
    follower_group = [] #判断是否已经加入该组
    group = Group.objects.all()
    for i in group:
        group_id.append(i.id)
    form = forms.AgreeForm()
    message = ''
    if request.method == "POST":
        form = forms.AgreeForm(request.POST)
        if form.is_valid():
            id = form.cleaned_data['groupid']
            name = form.cleaned_data['groupname']
            user = form.cleaned_data['name']
            for i in follower[0].group.all(): # 获取当前用户所有的组
                follower_group.append(i.id)
            if id not in group_id:
                message = "No GroupID is " + str(id) + " . Please try again."
            elif name != Group.objects.get(id=id).name:
                message = "Please entry the correct GroupName."
            elif user != follower[0].name:
                message = "Please entry the correct UserName."
            elif id in follower_group:
                message = 'You have already attended ' + name
            else:
                follower[0].group.add(Group.objects.filter(id=id)[0])
                message = 'Congratulations, successfully joined ' + name


    context = {'form': form, 'message': message, 'group': group, 'follower': follower[0], 'follower_doc':follower_doc,
                'status_pending':status_pending, 'status_delivered':status_delivered, 'status_error':status_error,
               'myFilter':myFilter
                }
    return render(request, 'accounts/follower.html', context)

# 下载文件
@log_in
@authority3
def download(request,pk):
    form = Document.objects.get(id=pk)
    filename = form.doc
    if request.method == "POST":
        file = open('static/file/' + str(filename), 'rb')
        response = FileResponse(file)
        new_filename = 'attachment;filename= ' + str(filename)
        response['Content-Type'] = 'application/octet-stream'
        response['Content-Disposition'] = new_filename.encode('utf-8', 'ISO-8859-1')
        return response
    context = {'form':form}
    return render(request, 'accounts/download.html',context)

# 查看组信息
@log_in
@authority3
def mygroup(request,pk):
    follower = User.objects.filter(name=pk)
    follower_group = follower[0].group.all()
    myFilter = filters.GroupFilter(request.GET, queryset=follower_group)
    follower_group=myFilter.qs
    context = {'myFilter':myFilter, 'follower_group':follower_group}
    return render(request, 'accounts/mygroup.html', context)

# 上传文件
@log_in
@authority3
def upload(request,pk):
    follower = User.objects.filter(name=pk)
    all_group = [] #该用户所参与的组
    for i in follower[0].group.all():
        all_group.append(i.id)
        print(all_group)
    # for i in follower[0].document_set.all():
    #     all_group.append(i.group_id)    # 用户文件全部参与的组
    #     print(all_group)
    message = ''
    form = forms.UploadForm()
    if request.method == "POST":
        form = forms.UploadForm(request.POST, request.FILES)
        if form.is_valid():
            use = form.cleaned_data['use']  # use.name 获取用户名，类型为str
            group = form.cleaned_data['group'] # group.id 获取组的ID， 类型为int
            doc = form.cleaned_data['doc']
            if use.name != follower[0].name:
                message = '该上传文件用户名不为你当前所使用的用户，不可以上传'
                return render(request, 'accounts/upload.html', locals())
            if group.id not in all_group:
                message = '你还没有参与该组，请先参与该组或者切换其他组'
                return render(request, 'accounts/upload.html', locals())
            if doc is not None:
                message='上传成功'
                form.save()
            else:
                message = '上传的文件不能为空'
                return render(request, 'accounts/upload.html', locals())
    context = {'form':form, 'message':message}
    return render(request, 'accounts/upload.html', context)

# 删除文件
@log_in
@authority3
def removedoc(request, pk):
    doc = Document.objects.get(id=pk)
    context = {'doc':doc}
    if request.method == "POST":
        doc.delete()
        return redirect('/follower/'+doc.use.name)
    return render(request, 'accounts/removedoc.html', context)

# 退出组
@log_in
@authority3
def quitgroup(request,pk,group):
    follower = User.objects.filter(name=pk)
    group = Group.objects.filter(id=group)
    doc = Document.objects.filter(use=follower[0].id, group=group[0].id) # 获取与用户名相同，组相同的文件
    context = {'group': group[0]}
    if request.method == "POST":
        follower[0].group.remove(*group) # 退出组
        for i in doc:   # 删除相关文件
            i.delete()
        return redirect('/mygroup/'+follower[0].name)
    return render(request, 'accounts/quitgroup.html', context)


# 没用到的函数

def viewgroup(request):
    return render(request, 'accounts/viewgroup.html')
def groupmsg(request):
    return render(request, 'accounts/groupmsg.html')




# Superuser page

# 超级用户基本操作
@log_in
@authority1
def superuser(request, pk):
    superuser = User.objects.filter(name=pk)[0]
    leader_counut = User.objects.filter(authority='2').count()
    follower_count = User.objects.filter(authority='3').count()
    user = User.objects.exclude(authority='1')

    # 搜索器
    myFilter = filters.UserFilter(request.GET, queryset=user)
    user = myFilter.qs


    context = {'leader_counut':leader_counut, 'follower_count':follower_count,'user':user,
                'myFilter': myFilter, 'superuser':superuser}
    return render(request, 'accounts/superuser.html', context)

# 删除用户
@log_in
@authority1
def removeuser(request, name, pk):
    user = User.objects.get(id=pk)
    admin_name = name
    if request.method == 'POST':
        user.delete()
        return redirect('/superuser/'+admin_name)
    context = {'user': user}
    return render(request, 'accounts/removeuser.html', context)

# message
def error(request):
    return render(request, 'accounts/error.html')

def resetmsg(request):
    user = User.objects.all()
    user_name = []
    for i in user:
        user_name.append(i.name)
    print(user_name)
    form = forms.ResetForm()
    message = ''
    if request.method == "POST":
        form = forms.ResetForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            oldpwd = form.cleaned_data['oldpassword']
            email = form.cleaned_data['email']
            newpwd1 = form.cleaned_data['newpassword1']
            newpwd2 = form.cleaned_data['newpassword2']
            if name in user_name:
                user2 = User.objects.filter(name=name)
                if oldpwd == user2[0].password:
                    if newpwd1 == newpwd2:
                        user2.update(password = newpwd2, email=email)
                        message = 'Congratulations, successfully updated!'
                        user2[0].save()
                    else:
                        message = 'Your New_Pwd and Con_Pwd is not match!'
                else:
                    message = 'Your Old_Pwd is not correct!'
            else:
                message = 'Account does not exist!'
    context = {'form':form, 'message':message}
    return render(request, 'accounts/resetmsg.html', context)