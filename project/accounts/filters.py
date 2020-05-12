import django_filters
from .models import *
from django_filters import DateFilter, CharFilter

class UserFilter(django_filters.FilterSet):
    start_date = DateFilter(field_name="date_created", lookup_expr="gte")
    end_date = DateFilter(field_name="date_created", lookup_expr="lte")
    # note = CharFilter(field_name="note", lookup_expr="icontains")

    class Meta:
        model = User
        fields = '__all__'
        exclude = ['email','date_created','password', 'group']


class GroupFilter(django_filters.FilterSet):
    start_date = DateFilter(field_name="date_created", lookup_expr="gte")
    end_date = DateFilter(field_name="date_created", lookup_expr="lte")
    note = CharFilter(field_name="note", lookup_expr="icontains")

    class Meta:
        model = Group
        fields = '__all__'
        exclude = ['date_created']


class DocumentFilter(django_filters.FilterSet):
    start_date = DateFilter(field_name="date_created", lookup_expr="gte")
    end_date = DateFilter(field_name="date_created", lookup_expr="lte")
    class Meta:
        model = Document
        fields = '__all__'
        exclude = ['doc','date_created','use']

class DocumentFilter2(django_filters.FilterSet):
    start_date = DateFilter(field_name="date_created", lookup_expr="gte")
    end_date = DateFilter(field_name="date_created", lookup_expr="lte")
    class Meta:
        model = Document
        fields = '__all__'
        exclude = ['doc','date_created', 'errormsg']