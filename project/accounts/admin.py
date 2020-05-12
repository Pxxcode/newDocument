from django.contrib import admin
from .models import *
# Register your models here.
#显示数据库表在admin上
class UserAdmin(admin.ModelAdmin):
    list_display = ['name', 'authority', 'group_list']
admin.site.register(User, UserAdmin)

class GroupAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'note', 'user_list']
admin.site.register(Group, GroupAdmin)

admin.site.register(Agree)
admin.site.register(Document)