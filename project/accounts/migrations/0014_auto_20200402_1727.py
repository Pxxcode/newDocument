# Generated by Django 2.1.7 on 2020-04-02 09:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0013_document_errormsg'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='errormsg',
            field=models.CharField(blank=True, max_length=500, null=True),
        ),
    ]