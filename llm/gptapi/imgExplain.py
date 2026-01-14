from openai import OpenAI
import base64

client = OpenAI()

def encode_image(image_path):
    with open(image_path, "rb") as f:
        return base64.b64encode(f.read()).decode("utf-8")

def img_explain(file_path):
    image_base64 = encode_image(file_path)  # 여기에 본인의 로컬 이미지 경로
    data_url = f"data:image/jpeg;base64,{image_base64}"
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[{
            "role": "user",
            "content": [
                {"type": "text", "text": "이 이미지에 대해 설명해줘"},
                {"type": "image_url", "image_url": {"url": data_url}},
            ],
        }]
    )
    return response.choices[0].message.content