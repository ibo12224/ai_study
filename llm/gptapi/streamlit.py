import streamlit as st
import os
import openai
from IPython.display import Audio,display

from openai import OpenAI

if "client" not in st.session_state:
    api_key = os.getenv('OPENAI_API_KEY')
    openai.api_key = api_key
    st.session_state['client']  = OpenAI()

def GPT(prompt):
    response = st.session_state['client'].chat.completions.create(
        model='gpt-3.5-turbo', 
        messages=[{'role':'user','content':prompt}]
    )
    return response.choices[0].message.content

with st.form('myform'):
    name = st.text_input('플롬프트')
    submit = st.form_submit_button('요청')
    if submit:
        rst = GPT(name)
        st.write( rst )

st.write('테스트')