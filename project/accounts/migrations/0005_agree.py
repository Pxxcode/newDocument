# Generated by Django 2.1.7 on 2020-03-19 13:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_auto_20200318_1207'),
    ]

    operations = [
        migrations.CreateModel(
            name='Agree',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('msg', models.CharField(max_length=500, null=True)),
                ('group', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.Group')),
            ],
        ),
    ]
