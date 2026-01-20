import streamlit as st
st.title("질문 답변 테스트")
with st.form('myform'):
    user_input = st.text_input('질문')
    submit = st.form_submit_button('입력')
    
    if submit:
        st.write('### 답변')
        st.write(f"입력값{user_input}")
