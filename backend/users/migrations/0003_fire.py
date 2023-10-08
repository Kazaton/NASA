# Generated by Django 4.2.6 on 2023-10-07 19:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_rename_user_userlocation'),
    ]

    operations = [
        migrations.CreateModel(
            name='Fire',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('country_id', models.CharField(max_length=10)),
                ('latitude', models.FloatField()),
                ('longitude', models.FloatField()),
                ('acq_date', models.DateField()),
                ('acq_time', models.TimeField()),
            ],
        ),
    ]