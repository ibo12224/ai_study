import streamlit as st

if 'my' not in st.session_state:
    print('call')
    st.session_state['my']=[]
# my =[]

with st.form('myform'):
    prompt = st.text_input('프롬프트:')
    submit = st.form_submit_button('확인')
    if submit:
        # my.append( prompt )
        st.session_state['my'].append( prompt )
        print('my:', st.session_state['my'])
        st.write( prompt )

