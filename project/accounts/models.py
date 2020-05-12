from django.db import models

# Create your models here.

# **组信息表
class Group(models.Model):
    # note为组的概述， name为组的名， date_created为组的创建日期
    note = models.CharField(max_length=500, null=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    name = models.CharField(max_length=200, null=True, unique=True)

    def __str__(self):
        return  self.name
    def user_list(self):
        return ','.join([i.name for i in self.user_set.all()])

# **用户表
class User(models.Model):
    # 使用Django自带的ID作为主键，并作为user_id
    # name字段为用户名, password为密码， email为邮箱， authority为权限，默认为3（组员），date_created为用户的创建日期
    name = models.CharField(max_length=200, null=False)
    password = models.CharField(max_length=200, null=False)
    email = models.CharField(max_length=200, null=True)
    authority = models.CharField(max_length=10, null=False,default='3')
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    group = models.ManyToManyField(Group)

    def __str__(self):
        return self.name
    def group_list(self):
        return ','.join([i.name for i in self.group.all()])

# **同意表
class Agree(models.Model):
    # 与group表形成外键，msg为描述的信息
    group = models.ForeignKey(Group, on_delete=models.CASCADE)
    msg = models.CharField(max_length=500, null=True)
    applicant = models.CharField(max_length=200, null=True)
    date_created = models.DateTimeField(auto_now_add=True, null=True)

# **文件表
class Document(models.Model):
    STATUS = (
        ('Pending', 'Pending'),
        ('Error', 'Error'),
        ('Delivered', 'Delivered'),
    )
    use = models.ForeignKey(User, on_delete=models.CASCADE)
    docname = models.CharField(max_length=200, null=True)
    doc = models.FileField(null=True, blank=True)
    status = models.CharField(max_length=200, null=True, choices=STATUS, default="Pending")
    date_created = models.DateTimeField(auto_now_add=True, null=True)
    group = models.ForeignKey(Group, on_delete=models.CASCADE, null=True)
    errormsg = models.CharField(max_length=500, null=True, blank=True)





