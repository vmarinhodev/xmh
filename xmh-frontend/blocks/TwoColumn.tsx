export interface TwoColumnBlock {
    blockType: "twoColumn";
    heading: string;
    text: string;
    image: string;
    direction: "left" | "right";
}

export default function TwoColumn({ heading, text, image, direction }: TwoColumnBlock) {
    return (
        <div>
            <h2>{heading}</h2>
            <p>{text}</p>
        </div>
    )
}