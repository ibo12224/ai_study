import streamlit as st
import os
import openai
from openai import OpenAI
apiKey = os.getenv('OPENAI_API_KEY')
openai.api_key = apiKey

client = OpenAI()

with st.form('myform'):
    prompt = st.text_input('프롬프트:')
    submit = st.form_submit_button('확인')
    if submit:
        s = f'프롬프트:{prompt}'
        with st.spinner('잠시 기다려 주세요...'):
            completion = client.chat.completions.create(model='gpt-4o',
                        messages=[{'role':'user', 'content':prompt}] )
        st.write( completion.choices[0].message.content )

