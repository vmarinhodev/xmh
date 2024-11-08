export const Hero = {
    slug: 'hero',
    labels: {
        singular: 'Hero Block',
        plural: 'Hero Blocks',
    },
    fields: [
        {
            name: 'heading',
            label: 'Heading',
            type: 'text',
        },
        {
            name: 'text',
            label: 'Text',
            type: 'textarea',
        },
        {
            name: 'backgroundImage',
            label: 'Background Image',
            type: 'upload',
            relationTo: 'media'
        }
    ]
}