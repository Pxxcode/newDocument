from django.forms import ModelForm
from django import forms
from .models import *

class GroupForm(ModelForm):
    class Meta:
        model = Group
        fields = '__all__' # 表单在页面显示的字段

class GroupForm2(forms.Form):
    groupname = forms.CharField(label='GroupName')
    note = forms.CharField(label='Note')

class CreateUserForm(forms.Form):
    name = forms.CharField(label='Name')
    password = forms.CharField(label='Password', widget=forms.PasswordInput)


class RegisterForm(forms.Form):
    authority = (
        ('2', 'leader'),
        ('3', 'follower')
    )
    name = forms.CharField(label='Name')
    password1 = forms.CharField(label='Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Con-Password', widget=forms.PasswordInput)
    email = forms.EmailField(label='Email', widget=forms.EmailInput)
    authority = forms.ChoiceField(label='Identity', choices=authority)

class ResetForm(forms.Form):
    name = forms.CharField(label='Name')
    oldpassword = forms.CharField(label='Old_Pwd', widget=forms.PasswordInput)
    email = forms.EmailField(label='Email', widget=forms.EmailInput)
    newpassword1 = forms.CharField(label='New_Pwd', widget=forms.PasswordInput)
    newpassword2 = forms.CharField(label='Con_Pwd', widget=forms.PasswordInput)


class AgreeForm(forms.Form):
    groupid = forms.IntegerField(label='GroupID')
    groupname = forms.CharField(label='GroupName')
    name = forms.CharField(label='Your Name')

class DownloadForm(ModelForm):
    class Meta:
        model = Document
        fields = '__all__'  # 表单在页面显示的字段
        exclude = ['use', 'status']

class UploadForm(ModelForm):
    # use = forms.CharField(label='UserName')
    # docname = forms.CharField(label='DocName')
    # doc = forms.FileField(label="Doc")
    # group = forms.CharField(label='Group')
    class Meta:
        model = Document
        fields = '__all__'  # 表单在页面显示的字段
        exclude = ['status', 'errormsg']



class UpdateForm(ModelForm):
    class Meta:
        model = Document
        fields = '__all__'
        exclude = ['docname', 'id', 'name', 'date_created', 'group', 'doc']

class UpdateForm2(forms.Form):
    STATUS = (
        ('Pending', 'Pending'),
        ('Error', 'Error'),
        ('Delivered', 'Delivered'),
    )
    status = forms.ChoiceField(label='Status', choices=STATUS)
    errormsg = forms.CharField(label='ErrorMsg', required=False)


