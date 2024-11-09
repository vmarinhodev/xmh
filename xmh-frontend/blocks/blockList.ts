import Hero, {HeroBlock } from "./Hero";
import TwoColumn, { TwoColumnBlock } from "./TwoColumn";

type BlockDataMap = {
    hero: HeroBlock;
    twoColumn: TwoColumnBlock;
};

export const blocks: { [K in keyof BlockDataMap]: React.FC<BlockDataMap[K]> } = {
    hero: Hero,
    twoColumn: TwoColumn,
};