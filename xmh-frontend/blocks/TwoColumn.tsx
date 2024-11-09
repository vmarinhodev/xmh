import Image from "next/image";

interface ImageProps {
    url: string,
    height: number,
    width: number,
    alt: string,
}

export interface TwoColumnBlock {
    blockType: "twoColumn";
    heading: string;
    text: string;
    image: ImageProps;
    direction: "left" | "right";
}

export default function TwoColumn({ heading, text, image, direction }: TwoColumnBlock) {
    return (
        <div
            className={`flex ${direction === "left" ? "flex-row" : "flex-row-reverse"} 
                items-center gap-6 max-h-[350px] overflow-hidden p-6 bg-white shadow-md 
                flex-col md:flex-row`}
        >
            {/* Image Section */}
            <div className="w-full md:w-1/2 h-full max-h-[350px] overflow-hidden flex-shrink-0">
                <Image
                    src={image.url}
                    height={image.height}
                    width={image.width}
                    alt={image.alt}
                    className="object-cover object-center w-full h-full"
                />
            </div>

            {/* Text Section */}
            <div className="w-full md:w-1/2 mt-4 md:mt-0">
                <h2 className="text-2xl font-semibold text-gray-800 mb-4">{heading}</h2>
                <p className="text-gray-600 leading-relaxed">{text}</p>
            </div>
        </div>
    );
}
