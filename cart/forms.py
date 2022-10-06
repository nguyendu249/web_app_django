from django import forms


class CartForm(forms.Form):
    course_id = forms.IntegerField(required=True, widget=forms.HiddenInput())
