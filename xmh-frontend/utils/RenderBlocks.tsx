import { blocks } from "@/blocks/blockList";
import { HeroBlock } from "@/blocks/Hero";
import { TwoColumnBlock } from "@/blocks/TwoColumn";
import React from "react";

// Union type for all possible BlockData types
type BlockData = HeroBlock | TwoColumnBlock;

// Define the type for the layout prop
interface RenderBlocksProps {
    layout: BlockData[];
}

// Type guard for narrowing blockType
function isBlockType<K extends keyof typeof blocks>(block: BlockData, type: K): block is BlockData & { blockType: K } {
    return block.blockType === type;
}

export default function RenderBlocks({ layout }: RenderBlocksProps) {
    return (
        <div>
            {layout.map((block, i) => {
                const BlockComponent: React.FC<any> = blocks[block.blockType];
                if (isBlockType(block, block.blockType)) {
                    return (
                        <BlockComponent  key={i} {...block} />
                    )
                }
                return null;
            })}
        </div>
    )
}