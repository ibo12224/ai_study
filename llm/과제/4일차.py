import streamlit as st
from ultralytics import YOLO
from PIL import Image
import os

img_path="image"

if not os.path.exists(img_path):
    os.makedirs(img_path)

model = YOLO('yolov8n.pt') 

st.sidebar.title("image")
file_list = [f for f in os.listdir(img_path) if f.lower().endswith(('.png', '.jpg', '.jpeg'))]

if not file_list:
    st.sidebar.info("저장된 이미지가 없습니다.")
    selected_file = None
else:
    selected_file = st.sidebar.selectbox("다시 볼 이미지를 선택하세요", file_list)
    
    if st.sidebar.button("파일 삭제"):
        os.remove(os.path.join(img_path, selected_file))
        st.rerun()

st.title("이미지 분석 시스템")
tab1, tab2 = st.tabs(["새 이미지 업로드", "저장된 이미지 분석"])
with tab1:
    
    uploaded_file = st.file_uploader("이미지", type=['jpg', 'png', 'jpeg'])

    if uploaded_file is not None:
        image = Image.open(uploaded_file)
        st.image(image, caption='올린 이미지', use_column_width=True)
        
        file_path=os.path.join(img_path,uploaded_file.name)
        
        with open(file_path,'wb') as f:
            f.write(uploaded_file.getbuffer())
        st.success(f"파일 저장: {file_path}")


        with st.spinner("이미지를 분석 중..."):
            results = model(image)
            st.image(results[0].plot(), caption="분석 결과", use_container_width=True)
        
            with st.expander("상세 감지 정보"):
                for box in results[0].boxes:
                    st.write(f"🔍 {model.names[int(box.cls[0])]}: {box.conf[0]:.2f}")
with tab2:
    if not selected_file:
        st.write("사이드바에서 이미지를 선택하거나 새로 업로드해 주세요.")
    else:
        st.subheader(f"파일명: {selected_file}")
        saved_path=os.path.join(img_path, selected_file)
        saved_image=Image.open(saved_path)
        with st.spinner("이미지를 분석 중..."):
            results = model(saved_image)
            st.image(results[0].plot(), caption="분석 결과", use_container_width=True)
            
            # 상세 정보 표시
            with st.expander("상세 감지 정보"):
                for box in results[0].boxes:
                    st.write(f"🔍 {model.names[int(box.cls[0])]}: {box.conf[0]:.2f}")


