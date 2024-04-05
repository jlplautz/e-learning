# from django import forms
from django.forms.models import inlineformset_factory

from .models import Course, Module

ModuleFormSet = inlineformset_factory(
    Course,
    Module,
    fields=['title', 'description'],
    # Allows you to set the num of empty extra forms to display in the formset
    extra=0,
    can_delete=True,
)
