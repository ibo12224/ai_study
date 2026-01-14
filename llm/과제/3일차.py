import streamlit as st
import os
from langchain_openai import ChatOpenAI
from langchain_core.messages import SystemMessage, HumanMessage, AIMessage

if "messages" not in st.session_state:
    st.session_state["messages"] = [
        SystemMessage(content="You are a helpful teacher")
    ]


#llm은 다양한 모델에서 똑같이 다루기 위해, 모델을 객채화 하기 위해
if "" not in st.session_state:
    st.session_state["llm"] = ChatOpenAI(
        model="gpt-3.5-turbo",
        api_key=os.getenv('OPENAI_API_KEY')
    )

#기존 값을 받아오고, llm에서 지금까지의 기록을 보내고 값을 받아와서, 저장한다.
def GPT_LangChain(prompt):
    st.session_state["messages"].append(HumanMessage(content=prompt))
    response = st.session_state["llm"].invoke(st.session_state["messages"])
    st.session_state["messages"].append(AIMessage(content=response.content))
    
    return response.content


with st.form('myform'):
    user_input = st.text_input('질문')
    submit = st.form_submit_button('확인')
    
    if submit:
        st.write('### 답변')
        rst = GPT_LangChain(user_input)
        st.write(rst)
