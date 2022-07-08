def main():
    out = []
    with open('host_names') as f:
        for s in f:
            s = s.strip()
            s = f'ssh jiayuc@{s} exit'
            out.append(s)
    out = '\n'.join(out)
    with open('conect2.sh', mode='w') as f:
        f.write(out)

    pass


if __name__ == '__main__':
    main()