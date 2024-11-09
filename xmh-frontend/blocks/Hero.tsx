// Define the types for each block's props
export interface HeroBlock {
    blockType: "hero";
    heading: string;
    text: string;
    backgroundImage: string;
}

export default function Hero({ heading, text, backgroundImage}: HeroBlock) {
    return (
        <div>
            <h2>{heading}</h2>
            <p>{text}</p>
        </div>
    )
}