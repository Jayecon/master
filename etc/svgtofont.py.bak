from fontTools.svgLib.path import SVGPath
from PIL import Image, ImageDraw, ImageFont

# SVG 파일 경로
SVG_FILE_PATH = "test.svg"

# 이모지 크기
EMOJI_SIZE = 128

# 이모지로 변환할 함수
def svg_to_emoji(svg_file_path):
    try:
        with open(svg_file_path, "r", encoding="utf-8") as f:
            svg_data = f.read()
            svg_path = SVGPath(svg_data)
            img = Image.new("RGBA", (EMOJI_SIZE, EMOJI_SIZE), color=(255, 255, 255, 0))
            draw = ImageDraw.Draw(img)
            svg_path.draw(draw, fill="black")
            img.show()  # 이미지를 보여줍니다. 저장하려면 img.save()를 사용하세요.
    except Exception as e:
        print("Error occurred while processing SVG data:", e)

# SVG 파일을 이모지로 변환합니다.
svg_to_emoji(SVG_FILE_PATH)

