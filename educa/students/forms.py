from django import forms

from educa.courses.models import Course


class CourseEnrollForm(forms.Form):
    course = forms.ModelChoiceField(
        queryset=Course.objects.all(),
        # you use a HiddenInput widget because you are not going to show this field to the user
        widget=forms.HiddenInput,
    )
